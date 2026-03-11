pkgname=ksteamtrayicon
pkgver=1.0.4
pkgrel=1
pkgdesc="A small Python script to keep the Steam tray icon in sync with the KDE Plasma 6 desktop color scheme"
arch=('any')
url="https://github.com/marcotuliomatos/ksteamtrayicon"
license=('MIT')
makedepends=(
  'gzip'
)
depends=(
  'plasma-workspace'
  'python'
  'python-dbus-next'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('0494ffa92d9ac49ad86e0d05fc37b71ae69df5daef7d8de40c121a629bd766d8')
install=ksteamtrayicon.install

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname"
  install -m 644 "dark-icon.png" \
    "$pkgdir/usr/share/$pkgname/dark-icon.png"
  install -m 755 "ksteamtrayicon.py" \
    "$pkgdir/usr/share/$pkgname/ksteamtrayicon.py"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/ksteamtrayicon.py" \
    "$pkgdir/usr/bin/ksteamtrayicon"

  install -d "$pkgdir/etc/xdg/autostart"
  install -m 644 "ksteamtrayicon.desktop" \
    "$pkgdir/etc/xdg/autostart/ksteamtrayicon.desktop"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/share/man/man1"
  gzip -c "man/ksteamtrayicon.1.en_US" \
    > "$pkgdir/usr/share/man/man1/ksteamtrayicon.1.gz"

  install -d "$pkgdir/usr/share/man/pt_BR/man1"
  gzip -c "man/ksteamtrayicon.1.pt_BR" \
    > "$pkgdir/usr/share/man/pt_BR/man1/ksteamtrayicon.1.gz"
}
