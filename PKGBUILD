# Maintainer: dim <mlrudasill@gmail.com>

pkgname='caelestia-greeter-git'
pkgver=1.0.1.r0.gf1e5b10
pkgrel=1
pkgdesc='A modern Material 3 Quickshell frontend for greetd matching the Caelestia design'
arch=('x86_64')
url='https://github.com/dim-ghub/Caelestia-Greeter'
license=('MIT')
install=caelestia-greeter.install
depends=('caelestia-cli' 'caelestia-shell' 'greetd' 'qt6-base' 'qt6-declarative')
makedepends=('git' 'cmake' 'ninja' 'pkgconf')
optdepends=('wlr-randr: multi-monitor configuration options'
            'cage: recommended lightweight kiosk Wayland compositor for greetd'
            'hyprland: kiosk compositor for the auto-deployed greetd config')
provides=('caelestia-greeter')
conflicts=('caelestia-greeter')
source=("$pkgname::git+$url.git" 'caelestia-greeter.install')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$pkgname"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
