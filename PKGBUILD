# Maintainer: tarball <bootctl@gmail.com>

pkgname=silverbullet
pkgver=0.3.1
pkgrel=1
pkgdesc='A clean Markdown-based writing/note taking application'
arch=(any)
url='https://github.com/silverbulletmd/silverbullet'
license=(MIT)
depends=(deno)
source=(
  "$pkgname-$pkgver.js::$url/releases/download/$pkgver/silverbullet.js"
  "$pkgname.service"
)
sha256sums=('5fe4acabdb503256c56e4a8293453cfaf9289e54e035f85ad0c6686f34dc5e47'
            '5309053371a003f3c32365eb15dbd38118ab2409a0a5737854261f821fe253a3')

package() {
  install -dm755 "$pkgdir/etc/default"

  cat >"$pkgdir/etc/default/$pkgname" <<EOF
HOST=localhost
PORT=3000
EOF

  install -Dm644 "$pkgname-$pkgver.js" \
    "$pkgdir/usr/lib/$pkgname/$pkgname.js"

  install -Dm644 "$srcdir/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
