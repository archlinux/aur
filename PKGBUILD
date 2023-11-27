# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='stack-of-tasks'
pkgname=eigenpy
pkgver=3.1.4
pkgrel=1
pkgdesc="Bindings between numpy and eigen using boost::python"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('boost-libs')
optdepends=('doxygen')
makedepends=('cmake' 'eigen' 'boost' 'python-numpy')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('ac96e2439a6975f7942c966317e6dc19261d103725d1e01e3115be7b4ec1b62f'
            'SKIP')
validpgpkeys=(
        'A031AD35058955293D54DECEC45D22EF408328AD'  # https://github.com/jcarpent.gpg
        'F182CC432A4752C7A3E4FE02001EB2069D785C81'  # https://github.com/proyan.gpg
        '1462AF00C9CF3C9E7AFC905E63380359F089A579'  # https://github.com/jorisv.gpg
        )

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DGENERATE_PYTHON_STUBS=ON
        cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver" -t test
}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
}
