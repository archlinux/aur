# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=firebuild
pkgver=0.8.1
pkgrel=1
pkgdesc="Automatic build accelerator cache for Linux"
url="https://firebuild.com/"
arch=('x86_64')
license=('custom')
depends=('libconfig' 'glibc' 'jemalloc' 'gcc-libs')
makedepends=('cmake' 'hopscotch-map' 'xxhash' 'python' 'python-jinja' 'libxslt' 'docbook-xsl')
optdepends=('graphviz: generating reports')
source=("$pkgname-$pkgver.tar.gz::https://github.com/firebuild/firebuild/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('160d1ec4b036cad62d3d5ea52d833df7a3db31bf7bfc48cde5bb81fb7a8554ce')

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
