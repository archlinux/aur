# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=bsd-leave
_debver=1.12
_debrel=2.2
pkgver="${_debver}_${_debrel}"
pkgrel=2
pkgdesc="program to remind you when to leave"
arch=('x86_64')
url="http://ftp.de.debian.org/debian/pool/main/l/leave/"
license=('BSD-3-Clause') # Debian common license
depends=('glibc')
source=("http://ftp.de.debian.org/debian/pool/main/l/leave/${pkgname#bsd-}_${_debver}.orig.tar.gz"
        "http://ftp.de.debian.org/debian/pool/main/l/leave/${pkgname#bsd-}_${_debver}-${_debrel}.diff.gz")
sha256sums=('de30529de8abf49004da4120ca352d5c588a657f8845e44d5e83a4860e6bbe1f'
            '5efa9008131b3f19b7a1cb44cce2f65d16d94dfce2cd660f2d2cb472a62520e8')

prepare() {
	cd "${pkgname#bsd-}-$_debver"

	patch -p1 -i "$srcdir/${pkgname#bsd-}_${_debver}-${_debrel}.diff"
}

build() {
	cd "${pkgname#bsd-}-$_debver"

    gcc -o leave leave.c $CFLAGS $CPPFLAGS -D__COPYRIGHT\(x\)= -D__RCSID\(x\)= $LDFLAGS
}

package() {
	cd "${pkgname#bsd-}-$_debver"

    install -Dm644 debian/copyright ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm755 leave "$pkgdir"/usr/bin/leave
    install -Dm644 leave.1 "$pkgdir"/usr/share/man/man1/leave.1
}
