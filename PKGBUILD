# Maintainer: zlsun <zlsun1995 at gmail dot com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: DrZaius <lou at fakeoutdoorsman dot com>
# Contributor: Victor Feight <vrfeight3 at gmail dot com>

pkgname=gsimplecal-lunar
_pkgname=gsimplecal
pkgver=2.1
pkgrel=2
pkgdesc="Simple and lightweight GTK calendar with lunar calendar patch"
arch=('i686' 'x86_64')
url="http://dmedvinsky.github.com/$_pkgname"
license=('BSD')
depends=('gtk3' 'lunar-calendar')
conflicts=('gsimplecal')
provides=('gsimplecal')
_lunar_patch="$pkgname-$pkgver.patch"
source=("$_pkgname-$pkgver.tar.gz::https://github.com/dmedvinsky/$_pkgname/archive/v$pkgver.tar.gz"
        $_lunar_patch)
md5sums=('170ac0bdc8663d97dec436e45b195491'
        'SKIP')

prepare() {
    cd "$_pkgname-$pkgver"
    patch -p1 -i "$srcdir/$_lunar_patch"
}

build() {
    cd "$_pkgname-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$_pkgname/COPYING
}

