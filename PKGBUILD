# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Alexander Lehmann <afwlehmann@googlemail.com>
pkgname=pasmo
pkgver=0.5.5
pkgrel=1
pkgdesc='Portable Z80 cross assembler'
arch=(x86_64)
url=https://pasmo.speccy.org
license=(GPL-2.0-only)
source=("$url/bin/$pkgname-$pkgver.tar.gz")
b2sums=('b571747454e4fc9c679619c3e72ee0ec93b03a669b14c6ec75c34a3823c294d921ef20ee0ba83c08c0f5a9bb7961a3a1adc5bcfb052e4d3a7afd1e826039ad9f')

build () {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package () {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
        AUTHORS \
        COPYING \
        ChangeLog \
        INSTALL \
        NEWS \
        README \
        pasmodoc.html
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}/examples" *.asm
}

check () {
	cd "$pkgname-$pkgver"
	make check
}
