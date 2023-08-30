# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=authy-electron
pkgver=2.4.1
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
_snaprev='21'
source=("authy-$pkgver-${_snaprev}.snap::https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap"
        "authy.sh")
sha256sums=('6b9cfa2f0760a1dcbcf1fee16acfdfd80320f66f5f196b0949ec5933a29418e6'
            'c76a44a0b42b7b590c4b6318b0544cedb96ef76b92269a79d29f71ced5c74331')

prepare() {
  unsquashfs -f -d "$srcdir/authy" "authy-$pkgver-${_snaprev}.snap"

  cd "$srcdir/authy"
  sed -i 's|${SNAP}/meta/gui/icon.png|authy|g' "meta/gui/authy.desktop"
}

package() {
  cd "$srcdir/authy"
  install -Dm644 resources/app.asar -t "$pkgdir/usr/lib/authy"
  install -Dm644 "meta/gui/authy.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 meta/gui/icon.png "$pkgdir/usr/share/pixmaps/authy.png"
  install -Dm755 "$srcdir/authy.sh" "$pkgdir/usr/bin/authy"
}
