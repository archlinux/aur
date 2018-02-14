# Maintainer: Jonatan Bravo <zephrax@gmail.com>
pkgname=universal-ctags
pkgver=git
pkgrel=1
epoch=
pkgdesc=" A maintained ctags implementation"
arch=("x86_64")
url="https://ctags.io"
license=('GPL-2.0')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("ctags", "readtags")
source=("https://github.com/universal-ctags/ctags/archive/master.zip")
sha256sums=("82bcb0a185db75053fc913274bf07a3e1f94d9dd7a1a5c45146f608f3636a1df")
validpgpkeys=()

package() {
	cd "${srcdir}/ctags-master"
	./autogen.sh
	./configure
	make
	mkdir -p "${pkgdir}/usr/local/bin"
	mkdir -p "${pkgdir}/usr/local/share/man/man1"
	mkdir -p "${pkgdir}/usr/local/share/man/man7"
	install -m755 -c ctags readtags "${pkgdir}/usr/local/bin/"
	install -m644 -c man/ctags-incompatibilities.7 man/ctags-optlib.7 "${pkgdir}/usr/local/share/man/man7"
	install -m644 -c man/ctags.1 "${pkgdir}/usr/local/share/man/man1"
}
