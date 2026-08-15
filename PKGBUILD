# Maintainer: dim <mlrudasill@gmail.com>

pkgname='caelestia-greeter'
pkgver=1.1.2
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
sha256sums=('b8eafd4ac91929a6dc4d06da0c501bae8784e4bfb8b3c8dcdcf73d1be658613b'
            '8b309545141845dcefaa9300327d3e4cdba331bbc755c13ad6bff0609171e330')

_builddir="Caelestia-Greeter-$pkgver"

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
