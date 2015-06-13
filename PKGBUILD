# Maintainer: Tom < reztho at archlinux dot us >
# Thanks to contributors/mantainers of frandom and dkms-nvidia packages
# since I used those packages as templates to make this one

pkgname=dkms-frandom
pkgver=1.1
pkgrel=4
pkgdesc="A very fast random number generator kernel module (DKMS version)"
arch=('any')
url="http://frandom.sourceforge.net/"
license=('GPL')
depends=('dkms' 'linux-headers')
provides=("frandom=${pkgver}")
conflicts=("frandom")
install=${pkgname}.install
options=(!strip)
_pkgname=frandom
source=("http://prdownloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.gz"
'frandom.udev.patch'
'dkms.conf'
'Makefile')

build(){
    patch $srcdir/$_pkgname-$pkgver/10-frandom.rules $srcdir/frandom.udev.patch
}

package() {
 	install -dm755 "$pkgdir/usr/src/$_pkgname-$pkgver"
 	install -m644  "$srcdir/$_pkgname-$pkgver/"*  "$pkgdir/usr/src/$_pkgname-$pkgver"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/10-$_pkgname.rules" "$pkgdir/usr/lib/udev/rules.d/10-$_pkgname.rules"
	install -m644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$_pkgname-$pkgver"
	install -m644 "$srcdir/Makefile" "$pkgdir/usr/src/$_pkgname-$pkgver"
}

md5sums=('aade48078496da7439eda41937a34e61'
         'f9a36f3a3c7f9caaae6475f6edea079c'
         '6b6ac64454740d8ba7d065a1ae903701'
         '1e94254311f05274035b5e41ff5a7a33')
