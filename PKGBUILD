pkgname=lyricbridge
pkgver=0.1.7
pkgrel=5
pkgdesc="Python + Flet lyrics tool inspired by 163MusicLyrics"
arch=('any')
url="https://github.com/wang1zhen/lyricbridge"
license=('Apache-2.0')
depends=(
  'python'
  'python-flet'
  'python-repath'
  'python-requests'
  'python-pycryptodome'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/wang1zhen/lyricbridge/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e0c7fccae6a08957e7d69a0ff628ecb014d3e3eb100718ba7035999a71931156')
optdepends=('pypinyin: optional pinyin output')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 lyricbridge.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 assets/app-logo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

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
