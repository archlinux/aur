# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=authy-electron
pkgver=2.2.0
pkgrel=1
pkgdesc="Two factor authentication desktop application"
arch=('x86_64')
url="https://authy.com"
license=('unknown')
depends=('electron')
makedepends=('squashfs-tools')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
_snapid='H8ZpNgIoPyvmkgxOWw5MSzsXK1wRZiHn'
_snaprev='10'
source=("${pkgname%-*}-$pkgver-$_snaprev.snap::https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap"
        "${pkgname%-*}.sh")
sha256sums=('b01f7f7d557faa9f837e3c69bf32141ec2e4784bb7e62dab12fd7f258332b46f'
            'b34f61cf1abc96de993449a9d05f586d3872800454a72f07d0f83634161d0d07')

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
