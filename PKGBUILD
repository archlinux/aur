# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=authy-electron
pkgver=2.4.2
pkgrel=1
_electronversion=25
pkgdesc="Two factor authentication desktop application"
arch=('x86_64')
url="https://authy.com"
license=('unknown')
depends=("electron${_electronversion}")
makedepends=('squashfs-tools')
provides=('authy')
conflicts=('authy')
_snapid='H8ZpNgIoPyvmkgxOWw5MSzsXK1wRZiHn'
_snaprev='22'
source=("authy-$pkgver-${_snaprev}.snap::https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap"
        "authy.sh")
sha256sums=('406bde28157122272c1a192ab3e953ee50c3204260a1e5dfe3d71c89d18ae115'
            'c76a44a0b42b7b590c4b6318b0544cedb96ef76b92269a79d29f71ced5c74331')

prepare() {
  unsquashfs -f -d "authy-$pkgver" "authy-$pkgver-${_snaprev}.snap"

  cd "authy-$pkgver"
  sed -i 's|${SNAP}/meta/gui/icon.png|authy|g' "meta/gui/authy.desktop"
}

package() {
  cd "authy-$pkgver"
  install -Dm644 resources/app.asar -t "$pkgdir/usr/lib/authy"
  install -Dm644 meta/gui/authy.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 meta/gui/icon.png "$pkgdir/usr/share/pixmaps/authy.png"
  install -Dm755 "$srcdir/authy.sh" "$pkgdir/usr/bin/authy"
}
