# Maintainer: Kevin Meagher <kmeagher at icecube dot wisc dot edu>

pkgname=icecube-sprng
pkgver=2.0b
pkgrel=2
pkgdesc="An ancient version of sprng needed by IceCube software"
arch=('i686' 'x86_64')
url="http://www.sprng.org/"
license=('CC BY-NC-SA 4.0')
source=("http://www.sprng.org/Version2.0/sprng2.0b.tar.gz")
sha256sums=('8985d7cae4f20f57889bc7ba11dfed226a02057d396731f4a5cc174704131ac2')

prepare() {
    patch --input="${startdir}/sprng2.patch" --directory="${srcdir}/sprng2.0/" --forward --strip=1
}

build() {
    cd "$srcdir/sprng2.0"
    make src
}

package() {
    cd "$srcdir/sprng2.0"
    install -Dm 644 lib/libsprng.a      $pkgdir/usr/lib/libsprng.a
    install -Dm 644 include/sprng.h     $pkgdir/usr/include/sprng/sprng.h
    install -Dm 644 include/interface.h $pkgdir/usr/include/sprng/interface.h
}