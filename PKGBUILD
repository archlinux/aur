# Maintainer: Nico Ramlow <nico@nycode.de>
pkgname=mcserv
pkgver=0.0.2
pkgrel=1
pkgdesc="CLI utility to manage MC server installations."
arch=('x86_64')
url="https://github.com/DRSchlaubi/mcserv"
license=('GPL3')
options=(!strip)
source=("https://github.com/DRSchlaubi/mcserv/releases/download/v$pkgver/$pkgname-$pkgver-linux.tar.gz")
sha256sums=("f66b44a740f55bac2bc7a0bb29a47fd125ac6e84895445513cef15d91cfe8bb4")

pkgver() {
    newVer=$(curl --silent https://api.github.com/repos/DRSchlaubi/mcserv/releases/latest | jq -r '."tag_name"')
    printf ${newVer#v}
}

package() {
	cd "$srcdir"
	mkdir -p "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin"
	rm $pkgname-$pkgver-linux.tar.gz
	cp $srcdir/* ${pkgdir}/opt/${pkgname}/
	chmod 755 "${pkgdir}/opt/${pkgname}/mcserv"
	ln -s "/opt/${pkgname}/mcserv" "${pkgdir}/usr/bin/${pkgname}"
}
