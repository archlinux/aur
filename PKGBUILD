# Maintainer: Samsagax <samsagax@gmail.com>
pkgname=steam_notif_daemon
pkgver=v1.0.1
pkgrel=1
license=('MIT')
pkgdesc='Simple XDG D-Bus Notification wrapper - using public sources'
makedepends=("meson" "systemd" "git")
depends=(
    "systemd-libs"
    "curl"
)
arch=("x86_64")
url='https://github.com/Joshua-Ashton/simple_notif_daemon'
source=(
    "${pkgname%-*}::git+https://github.com/Joshua-Ashton/simple_notif_daemon.git#tag=0ba7aef86eec3efda037258ccb8bdf1ae357a9b9"
)
sha512sums=('SKIP')

build() {
    cd "$pkgname"
    arch-meson -Dsd-bus-provider=libsystemd build
    ninja -C build
}

package() {
    cd "$pkgname"
    DESTDIR="$pkgdir/" ninja -C build install
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname%-*}"/LICENSE
}
