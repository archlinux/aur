# Maintainer: Óscar Pereira <myfirstname.ascii.only@randomwalk.eu>
_pkgname=vim-tex-seven
pkgname=${_pkgname}-git
pkgver=r133.001d01a
pkgrel=1
pkgdesc="Vim plugin for LaTeX documents"
arch=('any')
url="https://github.com/notnotrandom/vim-tex-seven"
license=('GPL')
depends=('vim-runtime>=7.0')
groups=('vim-plugins')
install=vimdoc.install
makedepends=('git')
provides=('vim-tex-seven')
source=('git+https://github.com/notnotrandom/vim-tex-seven.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}"

  installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "$installpath"/{autoload/tex_seven,doc,ftplugin,indent}

  install -Dm644 autoload/*.vim "$installpath"/autoload/

  for i in autoload/tex_seven doc ftplugin indent
  do
    install -Dm644 "${i}"/* "$installpath/${i}"/
  done
}
