# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=bsd-leave
_debver=1.12
_debrel=2.1
pkgver="${_debver}_${_debrel}"
pkgrel=2
pkgdesc="program to remind you when to leave"
arch=('x86_64')
url="http://ftp.de.debian.org/debian/pool/main/l/leave/"
license=('BSD')
depends=('glibc')
source=("http://ftp.de.debian.org/debian/pool/main/l/leave/${pkgname}_${_debver}.orig.tar.gz"
        "http://ftp.de.debian.org/debian/pool/main/l/leave/${pkgname}_${_debver}-${_debrel}.diff.gz")
sha256sums=('de30529de8abf49004da4120ca352d5c588a657f8845e44d5e83a4860e6bbe1f'
            '5e05d20357881e73c907b66716865e351b6e4e0e80eef472ff0dbe306abe19b5')

prepare() {
	cd "$pkgname-$_debver"

	patch -p1 -i "$srcdir/${pkgname}_${_debver}-${_debrel}.diff"
}

build() {
	cd "$pkgname-$_debver"

    gcc -o leave leave.c $CFLAGS $CPPFLAGS -D__COPYRIGHT\(x\)= -D__RCSID\(x\)= $LDFLAGS
}

package() {
	cd "$pkgname-$_debver"

    install -Dm644 debian/copyright ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm755 leave "$pkgdir"/usr/bin/leave
    install -Dm644 leave.1 "$pkgdir"/usr/share/man/man1/leave.1
}
