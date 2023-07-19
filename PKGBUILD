# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Anders Thomsen <mail nospamat andersthomsen nospamdot dk>

_pkgname=m-air-edit
pkgname=$_pkgname-bin
pkgver=1.8
pkgrel=1
pkgdesc='Remote control program for Midas M-AIR digital hardware mixers'
arch=(x86_64 armv7h)
url='https://www.midasconsoles.com/downloads.html'
license=('custom:MUSIC Group End User License Agreement')
depends=(alsa-lib freetype2 libcurl-gnutls libglvnd)
provides=($_pkgname)
conflicts=($_pkgname)
source=("EULA_2012-09-12.pdf"
        "m-air-edit.desktop")
source_x86_64=("https://mediadl.musictribe.com/download/software/midas/M-AIR/M-AIR-Edit_LINUX_${pkgver}.tar.gz")
source_armv7h=("https://mediadl.musictribe.com/download/software/midas/M-AIR/M-AIR-Edit_RASPI_${pkgver}.tar.gz")
sha256sums=('3321aa0b3e208133094665281a6fc2ca001628858cd1a6388185eac93569fca8'
            '7f88a5afac7e4097524797a7776f2a6619f4dae8d0cc6449fbb2e118fb6c1a7b')
sha256sums_x86_64=('6e06006b4cfeb70e3df51c42cec8e1d513f0f5278b49949ba31f1140565ddc1c')
sha256sums_armv7h=('f9b8cc5581ac7c74e0cc32ec249a8998c8788f205f3bcfa068a68032d0695484')


package() {
  # binary
  install -Dm755 "$srcdir"/M-AIR-Edit -t "$pkgdir"/usr/bin
  ln -sf "$srcdir"/M-AIR-Edit "$pkgdir"/usr/bin/$_pkgname
  # .desktop file
  install -Dm644 "$srcdir"/$_pkgname.desktop \
    -t "$pkgdir"/usr/share/applications
  # icon
  install -Dm644 "$srcdir"/M-AIR-Edit_icon.png \
    "$pkgdir"/usr/share/icons/$_pkgname.png
  # Release notes
  install -Dm644 "$srcdir"/*History.txt "$srcdir/Midas_M-AIR EDIT_"*.pdf \
    -t "$pkgdir"/usr/share/doc/$pkgname
  # EULA
  install -Dm644 "$srcdir"/EULA_2012-09-12.pdf \
    "$pkgdir"/usr/share/licenses/$pkgname/license.pdf
}
