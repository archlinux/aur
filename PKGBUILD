# Maintainer: shafrnv <shafrnv@users.noreply.github.com>
pkgname=u-ar-so-loud
pkgver=1.0.0
pkgrel=1
pkgdesc="u ar so loud! — mic/cam to Strudel + Hydra (phone via adb reverse)"
arch=('any')
url="https://github.com/shafrnv/u-ar-so-loud"
license=('MIT')
depends=('python')
optdepends=(
  'android-tools: phone mic/cam over USB (adb reverse)'
  'xdg-utils: open browser from start command'
)
source=("git+https://github.com/shafrnv/u-ar-so-loud.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  install -dm755 "$pkgdir/usr/share/$pkgname"
  install -Dm644 "$srcdir/$pkgname/index.html" "$pkgdir/usr/share/$pkgname/"
  install -Dm755 "$srcdir/$pkgname/start.sh" "$pkgdir/usr/share/$pkgname/"
  install -Dm755 "$srcdir/$pkgname/phone.sh" "$pkgdir/usr/share/$pkgname/"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/u-ar-so-loud" <<'EOF'
#!/usr/bin/env bash
exec /usr/share/u-ar-so-loud/start.sh "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/u-ar-so-loud"

  cat > "$pkgdir/usr/bin/u-ar-so-loud-phone" <<'EOF'
#!/usr/bin/env bash
exec /usr/share/u-ar-so-loud/phone.sh "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/u-ar-so-loud-phone"
}
