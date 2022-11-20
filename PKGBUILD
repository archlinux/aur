# Maintainer: Johan PONIN <johan.ponin.pro at gmail dot com>
# Contributor: Johan PONIN <johan.ponin.pro at gmail dot com>
# Contributor: tomxtobin
# Contributor: Earnest
pkgname=tiptop
pkgver=2.3.1
pkgrel=2
pkgdesc='hardware performance counters monitor'
url='http://tiptop.gforge.inria.fr'
arch=('i686' 'x86_64')
license=('GPL')

depends=('libxml2')
makedepends=('byacc' 'inetutils')

source=("https://files.inria.fr/pacap/tiptop/tiptop-$pkgver.tar.gz" "tiptop-2.3.1--format-security.patch")

sha1sums=('52ccd0d5dfa0a8a6f692c379e560a394a6f376b9'
          '0b651ff6a343ae4833e3a9ccbc3dd9c607f9d7c2')

prepare () {
    cd "$srcdir/$pkgname-$pkgver"
    patch --strip=1 --input="${srcdir}/tiptop-2.3.1--format-security.patch"
}

build() {
    cd tiptop-"$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd tiptop-"$pkgver"
    make DESTDIR="$pkgdir" install
}
