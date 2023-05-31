# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=authy-electron
pkgver=2.3.0
pkgrel=2
_electronversion=24
pkgdesc="Two factor authentication desktop application"
arch=('x86_64')
url="https://authy.com"
license=('unknown')
depends=("electron${_electronversion}")
makedepends=('squashfs-tools')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
_snapid='H8ZpNgIoPyvmkgxOWw5MSzsXK1wRZiHn'
_snaprev='19'
source=("${pkgname%-*}-$pkgver-$_snaprev.snap::https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap"
        "${pkgname%-*}.sh")
sha256sums=('58dfef718de47c5fc7419ee8a7221d0debd4e680d80c68ec852ed7554ef2ae3f'
            'ac2c49b4a4119114217c5633cbb79fcf4b39dde03d643fbdd468c4355b0d4d52')

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
