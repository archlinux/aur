# Maintainer: smiley <smiley@archlinux.org>
pkgname=cosmic-ext-applet-clippy-land-bin
_pkgname=cosmic-ext-applet-clippy-land
pkgver=1.1.2
pkgrel=1
pkgdesc="Clipboard history applet for the COSMIC panel (prebuilt binary)"
arch=('x86_64')
url="https://github.com/k33wee/clippy-land"
license=('GPL-3.0-or-later')
depends=('cosmic-panel' 'cosmic-icon-theme' 'fontconfig' 'glibc' 'libgcc'
         'libglvnd' 'libxkbcommon' 'wayland')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")
options=('!strip' '!debug')
source=("cosmic-applet-clippy-land_${pkgver}_amd64.deb::$url/releases/download/v$pkgver/cosmic-applet-clippy-land_${pkgver}_amd64.deb"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/k33wee/clippy-land/v$pkgver/LICENSE")
noextract=("cosmic-applet-clippy-land_${pkgver}_amd64.deb")
sha256sums=('9d7b4d845291ad5e7077c116afcd227cd8684e9b51e70d50065af0bd2ad02c97'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

prepare() {
  mkdir -p data
  bsdtar -xOf "cosmic-applet-clippy-land_${pkgver}_amd64.deb" 'data.tar.*' | bsdtar -xf - -C data
}

package() {
  cp -a data/usr "$pkgdir/"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
