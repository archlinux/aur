# Maintainer:
# Contributor: Elias Haddad <eliasynetto at gmail dot com>

pkgname=legion-y720-keyboard-backlight-git
pkgver=2.0.2.r4.g65518ad
pkgrel=1
pkgdesc="Simple C program to control the keyboard backlight on the Lenovo Legion Y720"
arch=(x86_64)
url="https://github.com/threadexio/Legion-Y720-Keyboard-Backlight"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')
depends=('libconfig')
makedepends=('git' 'cmake')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    cmake -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" PREFIX=/usr install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
