# Maintainer: fuero <fuerob@gmail.com>
pkgname=user-union
pkgver=0.14
pkgrel=1
pkgdesc="Tool to download source files or extract their URLs from RPM spec files"
license=('gpl2')
arch=('any')
url="https://www.dwheeler.com/user-union/"
_sfpath="http://downloads.sourceforge.net/${pkgname}"
source=($_sfpath/${pkgname}-${pkgver}.tar.gz)
depends=('rsync')
md5sums=('a746ffd1fc87f80f37fa34e0daf254f6')
options=('libtool' 'staticlibs')

build() {
    cd "$pkgname-$pkgver"

    autoreconf -i
    ./configure --prefix=/usr
    make clean || return 1
    make || return 1
}

package() {
    cd "$pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="$pkgdir/" install || return 1
}
