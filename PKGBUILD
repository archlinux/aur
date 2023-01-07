# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=authy-electron
pkgver=2.2.2
pkgrel=2
_electronversion=22
pkgdesc="Two factor authentication desktop application"
arch=('x86_64')
url="https://authy.com"
license=('unknown')
depends=("electron${_electronversion}")
makedepends=('squashfs-tools')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
_snapid='H8ZpNgIoPyvmkgxOWw5MSzsXK1wRZiHn'
_snaprev='12'
source=("${pkgname%-*}-$pkgver-$_snaprev.snap::https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap"
        "${pkgname%-*}.sh")
sha256sums=('bd26ea4f6b3994b114d52483682fac4baaade38ea248a61480ab9d3b958c3aee'
            '4f6d35fc188e37268ebadca0c23d1dda3f1d32218bf4d74e3eb387562adef34c')

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
