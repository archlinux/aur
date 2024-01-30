# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: emilweth <coucou@emi.cool>
pkgname=eco
pkgver=0.10.1.3
pkgrel=1
pkgdesc="Eco game client"
arch=('x86_64')
url="https://play.eco"
license=("All rights reserved")
source=(
  file://EcoLinux_v${pkgver}-beta.zip
  eco.desktop
  logo.png
)
b2sums=('5bd0f14cde7a3ee5d930d55e8d358567d50945630ba7a974edea01ea7fa1fe56121a691817fed9be5ea5f54467cbc5bf0a8e73b17a4f7ca881b91669a11c5e25'
        '52e88253b944a9e4d7167f69daf64047825d7df88cbe7163dffffd69f8fe0723a5c7c4f1aa84a9e8794743e4294b69f6e5fad300dd7323f87407bebe991b19f4'
        'dc1fe759cc43c311f3df7a39b0a73b0e273157b508ffaf5c741419a3d070507dcf93218061be6bec3f15bab8f4cdc213bec3eb4795145482fb54e8c71f0a4d14')
noextract=(EcoLinux_v${pkgver}-beta.zip)

prepare() {
  mkdir -p "$srcdir/$pkgname-$pkgver"
  bsdtar -xf "$srcdir/EcoLinux_v${pkgver}-beta.zip" -C "$srcdir/$pkgname-$pkgver" 
}

package () {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/opt"
  cp -dr --no-preserve='ownership' "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"

  install -Dm644 "$srcdir/logo.png" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/eco.png"
  install -Dm644 "$srcdir/eco.desktop" "$pkgdir/usr/share/applications/eco.desktop"

  chmod +x "$pkgdir/opt/$pkgname/Eco.x86_64"
}
