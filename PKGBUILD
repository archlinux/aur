# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=authy-electron
pkgver=2.2.1
pkgrel=2
_electronversion=20
pkgdesc="Two factor authentication desktop application"
arch=('x86_64')
url="https://authy.com"
license=('unknown')
depends=("electron${_electronversion}")
makedepends=('squashfs-tools')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
_snapid='H8ZpNgIoPyvmkgxOWw5MSzsXK1wRZiHn'
_snaprev='11'
source=("${pkgname%-*}-$pkgver-$_snaprev.snap::https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap"
        "${pkgname%-*}.sh")
sha256sums=('fdad2931755dee6129ee868dda604826fe6e3afd7343782f7e08b3d572fd6663'
            'e7df69d99022e0f04fa9e185b75bda26006b9d17c927c687384ca529f1590f06')

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
