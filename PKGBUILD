# Maintainer: Tom < reztho at archlinux dot us >
# Thanks to contributors/mantainers of frandom and dkms-nvidia packages
# since I used those packages as templates to make this one
# Contributor: Justin Gottula <justin@jgottula.com>

pkgname=dkms-frandom
pkgver=1.2
pkgrel=3
pkgdesc="A very fast random number generator kernel module (DKMS version)"
arch=('any')
url="http://frandom.sourceforge.net/"
license=('GPL')
depends=('dkms')
optdepends=('linux-headers')
provides=("frandom=${pkgver}")
conflicts=("frandom")
options=(!strip)
_pkgname=frandom
source=("http://www.billauer.co.il/download/${_pkgname}-${pkgver}.tar.gz"
'linux-6.4-compat.patch'
'frandom.udev.patch'
'dkms.conf'
'Makefile')

build() {
    cd "$srcdir/$_pkgname-${pkgver}"
    patch -p1 -i "$srcdir/linux-6.4-compat.patch"
    patch -p1 -i "$srcdir/frandom.udev.patch"
}

package() {
    install -dm755 "$pkgdir/usr/src/$_pkgname-$pkgver"
    install -m644  "$srcdir/$_pkgname-$pkgver/"*  "$pkgdir/usr/src/$_pkgname-$pkgver"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/10-$_pkgname.rules" "$pkgdir/usr/lib/udev/rules.d/10-$_pkgname.rules"
    install -m644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$_pkgname-$pkgver"
    install -m644 "$srcdir/Makefile" "$pkgdir/usr/src/$_pkgname-$pkgver"
}

md5sums=('4b862b8723ff9cedcab3a7c4feeaee42'
         '7349887f821ad71795cfdafeb41f16fb'
         'a41a534a4b732a6e2a0b41214fa27a1d'
         'b8943c145912d5da71dd84e54465bb85'
         '1e94254311f05274035b5e41ff5a7a33')
