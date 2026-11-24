# Maintainer: Mikołaj <mikolaj.q@wp.pl>

pkgname=mapstick-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Unofficial navigation map updater for Hyundai, Kia and Genesis: downloads the firmware onto a USB drive (precompiled binary)"
arch=('x86_64')
url="https://github.com/MikolajQ/mapstick"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'fontconfig' 'freetype2' 'libxkbcommon' 'udisks2' 'hicolor-icon-theme')
optdepends=('exfatprogs: format drives as exFAT'
            'libglvnd: hardware-accelerated rendering'
            'wayland: run on Wayland'
            'libx11: run on X11'
            'libxcursor: cursor themes on X11')
provides=('mapstick')
conflicts=('mapstick')
options=('!strip')

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/MikolajQ/mapstick/releases/download/v$pkgver/mapstick-$pkgver-x86_64-linux.tar.gz")
sha256sums_x86_64=('b2cd797196d3c2a4c07e13bf04740db272ffd13fd8a5d4e1a219ae3dcfa603c4')

package() {
  cd "mapstick-$pkgver-x86_64-linux"
  install -Dm0755 -t "$pkgdir/usr/bin/" mapstick
  install -Dm0644 -t "$pkgdir/usr/share/applications/" mapstick.desktop
  install -Dm0644 icons/mapstick.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/mapstick.svg"
  for size in 16 32 48 64 128 256 512; do
    install -Dm0644 "icons/mapstick-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x$size/apps/mapstick.png"
  done
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md README.pl.md
}
