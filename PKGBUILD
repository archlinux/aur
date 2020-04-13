 # Maintainer: aw1cks

pkgname=cartographer-dkms-git
_pkgname=Cartographer
pkgver=r15.6544036
pkgrel=1
pkgdesc="Linux Kernel Module to spoof /proc maps"
arch=('x86_64')
url="https://github.com/LWSS/Cartographer"
license=('GPL')
makedepends=('elfutils' 'dkms')
provides=('cartographer' 'cartographer-git')
conflicts=('cartographer-git')
source=('git://github.com/LWSS/Cartographer.git'
	'dkms.conf')
sha256sums=('SKIP'
	    '7cdc59c656ceb4d62ab032885d0908bde92551fbbddae50005c07cfdcdcbac6c')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -dm755 "$pkgdir/usr/src/$pkgname-$pkgver"
    cp cartographer.c "$pkgdir/usr/src/$pkgname-$pkgver"
    cp Makefile "$pkgdir/usr/src/$pkgname-$pkgver"
    install -Dm0644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$pkgname-$pkgver/dkms.conf"
    sed -e "s/$PKGNAME@/${pkgname}/" \
	-e "s/@PKGVER@/${pkgver}/" \
	-i "$pkgdir/usr/src/$pkgname-$pkgver/dkms.conf"
}
