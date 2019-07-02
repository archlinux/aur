pkgname="cameramonitor-quiet-git"
pkgver=r4.cfcb3aa
pkgrel=1
pkgdesc="A little monitor to check if your Webcam is On"
url="https://github.com/YanDoroshenko/cameramonitor-quiet"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('dbus')
makedepends=('cargo' 'rust' 'clang')
source=("git+https://github.com/YanDoroshenko/cameramonitor-quiet.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "$pkgdir"/usr/share/cameramonitor-quiet/img
    mkdir -p "$pkgdir"/usr/share/applications
    mkdir -p "$pkgdir"/usr/bin

    cd "cameramonitor-quiet"
    cargo build --release

    install -Dm755 "$srcdir"/cameramonitor-quiet/target/release/cameramonitor-quiet "$pkgdir"/usr/bin/
    install -Dm644 "$srcdir"/cameramonitor-quiet/img/cameramonitor.svg "$pkgdir"/usr/share/cameramonitor-quiet/img/
    install -Dm644 "$srcdir"/cameramonitor-quiet/img/cameramonitor_on.svg "$pkgdir"/usr/share/cameramonitor-quiet/img/
    install -Dm644 "$srcdir"/cameramonitor-quiet/img/cameramonitor_active.svg "$pkgdir"/usr/share/cameramonitor-quiet/img/
    install -Dm755 cameramonitor-quiet.desktop "$pkgdir"/usr/share/applications/
}

# vim:set ts=4 sw=4 ft=sh et:
