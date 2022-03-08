# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=authy-electron
pkgver=2.0.0
pkgrel=1
pkgdesc="Two factor authentication desktop application"
arch=('x86_64')
url="https://authy.com"
license=('unknown')
depends=('electron9')
makedepends=('squashfs-tools')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
_snapid='H8ZpNgIoPyvmkgxOWw5MSzsXK1wRZiHn'
_snaprev='8'
source=("${pkgname%-*}-$pkgver-$_snaprev.snap::https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap"
        "${pkgname%-*}.sh")
sha256sums=('d48db4388632777bf5f768932028c3517c31246762eacd558ad23fc0950c6e8f'
            '0fc1d3b29679a601108479fd535253f0b56b18f7a7fc8332a0d02e6e5c7c647f')

prepare() {
  unsquashfs -f -d "$srcdir/${pkgname%-*}" "${pkgname%-*}-$pkgver-$_snaprev.snap"

  cd "$srcdir/${pkgname%-*}"
  sed -i 's|${SNAP}/meta/gui/icon.png|authy|g' "meta/gui/${pkgname%-*}.desktop"
}

package() {
  cd "$srcdir/${pkgname%-*}"
  install -Dm644 resources/app.asar -t "$pkgdir/usr/lib/${pkgname%-*}"
  install -Dm644 "meta/gui/${pkgname%-*}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 meta/gui/icon.png "$pkgdir/usr/share/pixmaps/${pkgname%-*}.png"
  install -Dm755 "$srcdir/${pkgname%-*}.sh" "$pkgdir/usr/bin/${pkgname%-*}"
}
