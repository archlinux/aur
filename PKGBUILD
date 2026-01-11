pkgname=jasmine-wallpaper
_upstream=jasmine-wallpaper
pkgver=1.0.0
pkgrel=1
pkgdesc="GTK3 wallpaper picker and palette generator powered by matugen and swww"
arch=(any)
url="https://github.com/xo-xo-xo-xo/jasmine-wallpaper"
license=(MIT)
depends=(python python-gobject gtk3 matugen swww)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('253e5789335b3abb9acb5dc307dbceabc82cac5f7bcb0cc401613d7ede794fb9')

package() {
  local srcdir="$srcdir/$_upstream-$pkgver"

  install -Dm755 "$srcdir/jasmine/src/jasmine.py" \
    "$pkgdir/usr/share/$pkgname/jasmine.py"
  install -Dm644 "$srcdir/jasmine/assets/jasmine.ttf" \
    "$pkgdir/usr/share/$pkgname/assets/jasmine.ttf"

  install -Dm644 "$srcdir/jasmine/assets/jasmine-wallpaper.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/jasmine-wallpaper.svg"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/jasmine-wallpaper" <<'EOF'
#!/bin/sh
exec python /usr/share/jasmine-wallpaper/jasmine.py "$@"
EOF

  install -Dm644 "$srcdir/jasmine/jasmine-wallpaper.desktop" \
    "$pkgdir/usr/share/applications/jasmine-wallpaper.desktop"

  if [[ -f "$srcdir/LICENSE" ]]; then
    install -Dm644 "$srcdir/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
