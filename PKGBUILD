# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

pkgname=kwin-effects-yet-another-magic-lamp
pkgver=4.1
pkgrel=2
pkgdesc="Just Yet Another Magic Lamp effect"
arch=('x86_64')
url="https://github.com/zzag/$pkgname"
license=('GPL3')
depends=('kwin>=5.18.0')
makedepends=(extra-cmake-modules)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz
  f411876086099638677d35c4cc023e5d046eff6a.patch)
sha256sums=('12832e90ab52bb32239b8b1f4e3039250b68486f37e82e88c85eba89651fcb99'
            '74c7ba20069bb61f0291dd9f40535a943eefc1a69f5e350001bc36951ddb980c')

prepare() {
    mkdir -p build
    cd $srcdir/$pkgname-$pkgver
    patch --forward --strip=1 --input="${srcdir}/f411876086099638677d35c4cc023e5d046eff6a.patch"
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
