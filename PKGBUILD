# Maintainer: dim <mlrudasill@gmail.com>

pkgname='caelestia-greeter-git'
pkgver=1.0.0.r1.gf1e5b10
pkgrel=1
pkgdesc='A modern Material 3 Quickshell frontend for greetd matching the Caelestia design'
arch=('x86_64')
url='https://github.com/dim-ghub/Caelestia-Greeter'
license=('MIT')
depends=('quickshell-git' 'greetd' 'wlr-randr' 'qt6-m3shapes-git' 'qt6-base' 'qt6-declarative')
makedepends=('git' 'cmake' 'ninja' 'pkgconf')
optdepends=('cage: recommended lightweight kiosk Wayland compositor for greetd')
provides=('caelestia-greeter')
conflicts=('caelestia-greeter')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 --match 'v[0-9]*' \
        | sed -E 's/^[^0-9]*//; s/([^-]*-g)/r\1/; s/-/./g'
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
