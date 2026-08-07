# Maintainer: dim <mlrudasill@gmail.com>

pkgname='caelestia-greeter'
pkgver=1.0.1
pkgrel=1
pkgdesc='A modern Material 3 Quickshell frontend for greetd matching the Caelestia design'
arch=('x86_64')
url='https://github.com/dim-ghub/Caelestia-Greeter'
license=('MIT')
install=caelestia-greeter.install
depends=('caelestia-cli' 'caelestia-shell' 'quickshell-git' 'greetd' 'qt6-base' 'qt6-declarative')
makedepends=('cmake' 'ninja' 'pkgconf')
optdepends=('wlr-randr: multi-monitor configuration options'
            'cage: recommended lightweight kiosk Wayland compositor for greetd'
            'hyprland: kiosk compositor for the auto-deployed greetd config')
provides=('caelestia-greeter')
conflicts=('caelestia-greeter-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'caelestia-greeter.install')
sha256sums=('df86eecfd92c3f711bb9c866f36eaefefa98ed5e919f167d66b3188978dc311d'
            'f0f052f9df9b229f043627c93d0e75e72f0d6afee654f6b692310cab6bed450b')

_builddir='Caelestia-Greeter-1.0.1'

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
