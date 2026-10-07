# Maintainer: Throdne <Throdne@gmail.com>
pkgname=wayland-scroll-forwarder-git
_pkgname=wayland-scroll-forwarder
pkgver=r17.1f338f3
pkgrel=1
pkgdesc='Fix the mouse wheel in NVIDIA GeForce NOW (and other X11 apps) on Wayland'
arch=('any')
url='https://github.com/Throdne/wayland-scroll-forwarder'
license=('GPL-3.0-or-later')
depends=('python' 'python-evdev' 'python-xlib')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$_pkgname.install
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm755 scroll_forwarder.py "$pkgdir/usr/bin/wayland_scroll_forwarder"
  install -Dm644 'contrib/wayland-scroll-forwarder@.service' \
    "$pkgdir/usr/lib/systemd/user/wayland-scroll-forwarder@.service"
  install -Dm644 contrib/99-scroll-forwarder.rules \
    "$pkgdir/usr/lib/udev/rules.d/99-scroll-forwarder.rules"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
