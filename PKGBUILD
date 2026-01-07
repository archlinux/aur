pkgname=lyricbridge
pkgver=0.1.6
pkgrel=1
pkgdesc="Python + Flet lyrics tool inspired by 163MusicLyrics"
arch=('any')
url="https://github.com/wang1zhen/lyricbridge"
license=('Apache-2.0')
depends=(
  'python'
  'python-flet'
  'python-requests'
  'python-pycryptodome'
  'python-pypinyin'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/wang1zhen/lyricbridge/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2ac2302dd94ea0ce4fc8d102c3057366bb2a683bc049ec4e28ce0629221a64c1')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/share/$pkgname"
  install -Dm644 app.py "$pkgdir/usr/share/$pkgname/app.py"
  cp -r assets "$pkgdir/usr/share/$pkgname/"
  cp -r lyricbridge "$pkgdir/usr/share/$pkgname/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<'EOS'
#!/usr/bin/env bash
cd /usr/share/lyricbridge || exit 1
exec /usr/bin/python app.py
EOS
}
