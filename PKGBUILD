# Maintainer: Óscar Pereira <sourcery@randomwalk.eu>
_pkgname=vim-tex-seven
pkgname=${_pkgname}-git
pkgver=r159.a6d7480
pkgrel=2
pkgdesc="Vim plugin for LaTeX documents"
arch=('any')
url="https://github.com/notnotrandom/vim-tex-seven"
license=('GPL')
depends=('vim-runtime>=7.0')
optdepends=("perl-json: to retrive \label's asynchronously")
groups=('vim-plugins')
install=vimdoc.install
makedepends=('git')
provides=('vim-tex-seven')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}"

  installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "$installpath"/{autoload/tex_seven,doc,ftplugin,indent,scripts}

  install -Dm644 autoload/*.vim "$installpath"/autoload/

  for i in autoload/tex_seven doc ftplugin indent scripts
  do
    install -Dm644 "${i}"/* "$installpath/${i}"/
  done
}
