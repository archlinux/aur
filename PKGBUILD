# Maintainer: backmeupplz
pkgname=farcaster-tui
pkgver=0.1.3
pkgrel=1
pkgdesc="A terminal-based Farcaster client"
arch=('x86_64')
url="https://github.com/backmeupplz/farcaster-tui"
license=('MIT')
depends=('bun-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/backmeupplz/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r src package.json bun.lock "$pkgdir/usr/lib/$pkgname/"

  cd "$pkgdir/usr/lib/$pkgname"
  bun install --frozen-lockfile --production

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/sh
exec bun /usr/lib/farcaster-tui/src/index.tsx "$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"

  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
