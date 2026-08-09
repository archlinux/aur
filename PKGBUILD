# Maintainer: dim <mlrudasill@gmail.com>

pkgname='caelestia-greeter'
pkgver=1.1.0
pkgrel=1
pkgdesc='A modern Material 3 Quickshell frontend for greetd matching the Caelestia design'
arch=('x86_64')
url='https://github.com/dim-ghub/Caelestia-Greeter'
license=('MIT')
install=caelestia-greeter.install
depends=('caelestia-cli' 'caelestia-shell' 'greetd' 'qt6-base' 'qt6-declarative')
makedepends=('cmake' 'ninja' 'pkgconf')
optdepends=('wlr-randr: multi-monitor configuration options'
            'cage: recommended lightweight kiosk Wayland compositor for greetd'
            'hyprland: kiosk compositor for the auto-deployed greetd config')
provides=('caelestia-greeter')
conflicts=('caelestia-greeter-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'caelestia-greeter.install')
sha256sums=('3ae367d9c020b6bfedb5ab653691968f8224da0a6c497ffb27c0a1ae905cfc5f'
            '06b3a1381ce4595938ca6a353a051aac9b1f4d9e4283e48a701f5cf5db30a437')

_builddir='Caelestia-Greeter-1.1.0'

build() {
    cd "${srcdir}/${_builddir}"
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCAELESTIA_GREETER_VERSION=$pkgver
    cmake --build build
}

package() {
    cd "${srcdir}/${_builddir}"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
