# Maintainer: Kurobac <rkurobac at gmail dot com>

pkgname=usb2notify
pkgver=1.0.0
pkgrel=1
pkgdesc='Notify when a SuperSpeed USB device connects at USB 2.0 speed'
arch=('any')
url='https://github.com/Kurobac/usb2notify'
license=('MIT')
depends=('libnotify' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ee80952f55d5a78e70cc4828fffaf604d0bf514fe1cd107538599c1a6c851ff9')

check() {
  cd "$pkgname-$pkgver"
  python -B -m unittest discover -s tests
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 src/usb2notify.py "$pkgdir/usr/bin/usb2notify"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 systemd/usb2notify.service.in \
    "$pkgdir/usr/lib/systemd/user/usb2notify.service"
  sed -i 's|@USB2NOTIFY_EXEC@|/usr/bin/usb2notify|' \
    "$pkgdir/usr/lib/systemd/user/usb2notify.service"
}
