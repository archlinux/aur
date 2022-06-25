# Maintainer: Robin Candau <robincandau@protonmail.com>
# Contributor: Matteo Salonia <saloniamatteo@protonmail.com> 
# Contributor: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=ddgr-git
_pkgname=ddgr
pkgver=2.0
pkgrel=1
pkgdesc="DuckDuckGo from the terminal"
arch=('any')
url="https://github.com/jarun/ddgr"
license=('GPL3')
depends=('python>=3.5')
makedepends=('git')
conflicts=("ddgr")
source=("git+$url")
sha256sums=("SKIP")

pkgver() {
  cd "${_pkgname}"
  _pkgver=$(grep -om1 "[0-9]\.[0-9]" CHANGELOG)
  echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
	# install ddgr into /usr/bin/ddgr
	make -C "ddgr" DESTDIR="${pkgdir}" PREFIX="/usr" install
	# go into the package directory
	cd "$srcdir/ddgr"
	# install the fish autocompletion
	install -Dm644 auto-completion/fish/ddgr.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ddgr.fish"
	# install the bash autocompletion
	install -Dm644 auto-completion/bash/ddgr-completion.bash "${pkgdir}/etc/bash_completion.d/ddgr"
	# install the zsh autocompletion
	install -Dm644 auto-completion/zsh/_ddgr "${pkgdir}/usr/share/zsh/site-functions/_ddgr"
}
