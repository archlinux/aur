# Maintainer: Balint Reczey <rbalint at balintreczey dot hu>

pkgname=firebuild
pkgver=0.8.4
pkgrel=1
pkgdesc="Automatic build accelerator cache for Linux"
url="https://firebuild.com/"
arch=('x86_64')
license=('custom')
depends=('libconfig' 'glibc' 'jemalloc' 'gcc-libs')
makedepends=('cmake' 'hopscotch-map' 'xxhash' 'python' 'python-jinja' 'libxslt' 'docbook-xsl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/firebuild/firebuild/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('00c1130e8d5fb21136cc10519e2769003041b2f61aa516339576dd76cb785497')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR='/etc' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
