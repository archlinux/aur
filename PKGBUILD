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
sha256sums=("c89e85703500d430f6c9c4d097d09cb6cb2866e35485e280df536a47681b3ca4")

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
