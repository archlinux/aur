# Maintainer: Filth <filth [at] wagn [dot] me>

# The My Femboy Roommate game must be purchased from:
# https://nuteku.itch.io/my-femboy-roommate
# and placed in the same directory as this PKGBUILD.

_pkgname=my-femboy-roommate
pkgname="$_pkgname-bin"
pkgver=1.1
pkgrel=1
pkgdesc="Visual novel about moving in with your new femboy roommate. (bundled Ren'Py)"
arch=('x86_64')
options=("!strip" "!debug")
url="https://nuteku.itch.io/my-femboy-roommate"
license=('custom')
depends=('bash')
makedepends=('imagemagick')
source=("$_pkgname.desktop"
        "file://My-Femboy-Roommate-$pkgver-pc.zip")
b2sums=('e5954fd93e536cb1689dc0457fc63300e59fff091a358e43ae1cb1156a357464d696444c5076d1c701fa999ab93fce633120c6fcb4c742531f50cbdac97b241e'
        'c48d65671f1523ce9108720767b5d047717542012a4482f4fe822358ea13ec5d38fd7f51e87cf72b88543dd35c8841a4d6627f3744a2f91eb437c7b5a7a9044c')

package() {
  install -dm755 "$pkgdir/usr/share/pixmaps"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/games/$_pkgname"
  install -dm755 "$pkgdir/usr/bin"

  # Remove unnecessary Windows files
  rm -rf "My-Femboy-Roommate-$pkgver-pc/My-Femboy-Roommate.exe" \
         "My-Femboy-Roommate-$pkgver-pc//lib/py3-windows-x86_64"

  install "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  magick "My-Femboy-Roommate-$pkgver-pc/favicon.ico" -thumbnail 256x256 -alpha on -background none -flatten "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  cp -r My-Femboy-Roommate-$pkgver-pc/* "$pkgdir/usr/share/games/$_pkgname"

  echo "#!/bin/sh
cd /usr/share/games/${_pkgname}
exec ./My-Femboy-Roommate.sh \"\$@\"" > "${pkgdir}/usr/bin/${_pkgname}"
  chmod +x "${pkgdir}/usr/bin/${_pkgname}"
}