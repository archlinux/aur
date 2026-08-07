# Maintainer: dim <mlrudasill@gmail.com>

pkgname='caelestia-greeter'
pkgver=1.0.1
pkgrel=1
pkgdesc='A modern Material 3 Quickshell frontend for greetd matching the Caelestia design'
arch=('x86_64')
url='https://github.com/dim-ghub/Caelestia-Greeter'
license=('MIT')
depends=('quickshell-git' 'greetd' 'wlr-randr' 'qt6-m3shapes-git' 'qt6-base' 'qt6-declarative')
makedepends=('cmake' 'ninja' 'pkgconf')
optdepends=('cage: recommended lightweight kiosk Wayland compositor for greetd')
provides=('caelestia-greeter')
conflicts=('caelestia-greeter-git')
# TODO: replace with `updpkgsums` once the v1.0.1 tag exists upstream.
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCAELESTIA_GREETER_VERSION=$pkgver
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
