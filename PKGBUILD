# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Anders Thomsen <mail nospamat andersthomsen nospamdot dk>

_pkgname=m-air-edit
pkgname=$_pkgname-bin
pkgver=1.8.1
pkgrel=1
pkgdesc='Remote control program for Midas M-AIR digital hardware mixers'
arch=(x86_64 armv7h)
url='https://www.midasconsoles.com/downloads.html'
license=('LicenseRef-MUSIC Group End User License Agreement')
depends=(gcc-libs glibc alsa-lib curl freetype2 libglvnd)
provides=($_pkgname)
conflicts=($_pkgname)
source=("EULA_2012-09-12.pdf"
        "m-air-edit.desktop"
        "M-AIR-Edit_icon.png")
source_x86_64=("https://mediadl.musictribe.com/download/software/midas/M-AIR/M-AIR-Edit_LINUX_${pkgver}.tar.gz")
source_armv7h=("https://mediadl.musictribe.com/download/software/midas/M-AIR/M-AIR-Edit_RASPI_${pkgver}.tar.gz")
sha256sums=('3321aa0b3e208133094665281a6fc2ca001628858cd1a6388185eac93569fca8'
            '7f88a5afac7e4097524797a7776f2a6619f4dae8d0cc6449fbb2e118fb6c1a7b'
            '6ead06b892d79e7cecddf89b189de1bc46476be33f88270b2ba86f0f0e96d5cb')
sha256sums_x86_64=('cd8633b8630324ade52ebb2cef3248cffc9512197aee94d53c9a2739d824a089')
sha256sums_armv7h=('6a7ab8a12fd2368f4f79eb7ef9a6f15dfb45def74bf139848cb732e258eeaa11')


package() {
  # binary
  install -Dm755 "$srcdir"/M-AIR-Edit -t "$pkgdir"/usr/bin
  ln -sf M-AIR-Edit "$pkgdir"/usr/bin/$_pkgname
  # .desktop file
  install -Dm644 "$srcdir"/$_pkgname.desktop \
    -t "$pkgdir"/usr/share/applications
  # icon
  install -Dm644 "$srcdir"/M-AIR-Edit_icon.png \
    "$pkgdir"/usr/share/icons/$_pkgname.png
  # Release notes
  install -Dm644 "$srcdir"/*History.txt \
    -t "$pkgdir"/usr/share/doc/$pkgname
  # EULA
  install -Dm644 "$srcdir"/EULA_2012-09-12.pdf \
    "$pkgdir"/usr/share/licenses/$pkgname/license.pdf
}
