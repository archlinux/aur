# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

pkgname=kwin-effects-yet-another-magic-lamp
pkgver=4.1.3
pkgrel=1
pkgdesc="Just Yet Another Magic Lamp effect"
arch=('x86_64')
url="https://github.com/zzag/$pkgname"
license=('GPL3')
depends=('kwin>=5.18.0')
makedepends=(extra-cmake-modules)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz
)
sha256sums=('f235ddc5d7117ad1b379c2f2c1682b2b8529e9f58b2f19295c91902f6356d290')

prepare() {
    mkdir -p build
    cd $srcdir/$pkgname-$pkgver
}

build() {
    cd build
    cmake ../$pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
