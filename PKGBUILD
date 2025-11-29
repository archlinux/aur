# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Andreas Hauser <andy-aur@splashground.de>
# Contributor: Beej Jorgensen <beej@beej.us>

pkgname=fann
pkgver=2.2.0
pkgrel=7
pkgdesc='Fast Artificial Neural Network Library'
url='https://leenissen.dk/fann/'
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=(
    'glibc')
makedepends=(
    'cmake')
source=("https://github.com/libfann/fann/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f31c92c1589996f97d855939b37293478ac03d24b4e1c08ff21e0bd093449c3c')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING='3.5' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
