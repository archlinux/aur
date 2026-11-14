# Maintainer: 9M2PJU <https://hamradio.my>
pkgname=localfly-linux-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Your localhost, on the internet — bore tunnels with an Adwaita window + tray"
arch=('x86_64' 'aarch64')
url="https://github.com/9M2PJU/localfly-linux"
license=('MIT')
depends=('python-gobject' 'gtk4' 'libadwaita' 'curl' 'hicolor-icon-theme')
makedepends=('git' 'rust')
provides=('localfly-linux')
conflicts=('localfly-linux' 'localfly-linux-bin')
source=('git+https://github.com/9M2PJU/localfly-linux.git')
sha256sums=('SKIP')

pkgver() {
  cd localfly-linux
  git describe --long --tags | sed 's/^v//;s/-/./g'
}

build() {
  cd localfly-linux
  cargo build --locked --release
}

package() {
  cd localfly-linux
  install -Dm755 target/release/localfly "$pkgdir/usr/bin/localfly"
  install -Dm755 gui/localfly-gui "$pkgdir/usr/bin/localfly-gui"
  install -Dm644 gui/localfly_backend.py "$pkgdir/usr/share/localfly/gui/localfly_backend.py"
  install -Dm644 gui/localfly_gui.py "$pkgdir/usr/share/localfly/gui/localfly_gui.py"
  install -Dm644 gui/sni.py "$pkgdir/usr/share/localfly/gui/sni.py"
  install -Dm644 com.localfly.Localfly.desktop "$pkgdir/usr/share/applications/com.localfly.Localfly.desktop"
  install -Dm644 packaging/icons/localfly.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/localfly.png"
  install -Dm644 packaging/localfly.service "$pkgdir/usr/lib/systemd/user/localfly.service"
}
