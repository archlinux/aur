# Maintainer: Aidan Heeney <aidan.heeney@proton.me>
# Built from the repo's desktop-vX.Y.Z tags (the phone app's are v1.0.<n>).
pkgname=nullspace
pkgver=1.0.0
pkgrel=1
pkgdesc='Tasks, notes, screen captures and voice notes from one key, with Squelch dictation'
arch=('any')
url='https://github.com/ieatfood314/nullspace'
license=('MIT')
depends=('squelch' 'python' 'python-pyqt6' 'python-pyqt6-webengine' 'qt6-svg'
         'qt6-imageformats' 'spectacle' 'libnotify' 'python-gobject'
         'at-spi2-core' 'layer-shell-qt')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/desktop-v$pkgver.tar.gz")
sha256sums=('9645ef28c1fd2ab13dcaf35e96fae809d535fc67c547a0b44f73730fb362590d')

package() {
  cd "$srcdir/$pkgname-desktop-v$pkgver"
  install -Dm755 desktop/nullspace-desktop -t "$pkgdir/usr/bin/"
  install -Dm755 server/nullspace.py -t "$pkgdir/usr/lib/nullspace/server/"
  install -d "$pkgdir/usr/lib/nullspace/web"
  cp -r web/. "$pkgdir/usr/lib/nullspace/web/"
  install -Dm644 desktop/nullspace-desktop.service desktop/nullspace-hub.service \
    -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 desktop/nullspace.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 web/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/nullspace.svg"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
