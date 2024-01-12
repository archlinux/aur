# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: emilweth <coucou@emi.cool>
pkgname=eco
pkgver=0.10.0.4
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
b2sums=('9f77360298195b75cfdcfe7b94390276a5d63a93a055ad36744b2aaa243031a77f609456460925b4c9c0ffdd02f80f72fca5de6c490c9f7ab69bb1d3667437af'
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
