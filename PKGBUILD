# Maintainer: def1de <iliakat.kr@gmail.com>
pkgname=wwidgt
pkgver=1.0.1
pkgrel=1
pkgdesc="A gtk-based widget framework for wl-roots based compositors"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/def1de/wwidgt"
license=('MIT')
options=('!debug')
depends=('gtk4' 'gtk4-layer-shell' 'libxml2' 'curl' 'glib2')
makedepends=('cmake' 'ninja' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/def1de/wwidgt/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    cmake -S . -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    DESTDIR="${pkgdir}" ninja -C build install

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}