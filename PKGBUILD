# Maintainer: Matteo Salonia <saloniamatteo@protonmail.com> 
# Maintainer: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>
# Based on ddgr's PKGBUILD from the AUR

pkgname=ddgr-git
pkgver=1.8.1
pkgrel=1
pkgdesc="DuckDuckGo from the terminal"
arch=('any')
url="https://github.com/jarun/ddgr"
license=('GPL3')
depends=('python>=3.5')
conflicts=("ddgr")
source=("https://github.com/jarun/ddgr/archive/v$pkgver.tar.gz")
sha256sums=("d223a3543866e44e4fb05df487bd3eb23d80debc95f116493ed5aad0d091149e")

package() {
	# install ddgr into /usr/bin/ddgr
	make -C "ddgr-${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr" install
	# go into the package directory
	cd "$srcdir/ddgr-$pkgver"
	# install the fish autocompletion
	install -Dm644 auto-completion/fish/ddgr.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ddgr.fish"
	# install the bash autocompletion
	install -Dm644 auto-completion/bash/ddgr-completion.bash "${pkgdir}/etc/bash_completion.d/ddgr"
	# install the zsh autocompletion
	install -Dm644 auto-completion/zsh/_ddgr "${pkgdir}/usr/share/zsh/site-functions/_ddgr"
}
