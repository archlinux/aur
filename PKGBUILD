# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributer: Wouter Wijsman <wwijsman@live.nl>

pkgname=dosbox-staging
pkgver=0.82.2
pkgrel=3
epoch=1
pkgdesc="DOS/x86 emulator focusing on ease of use. Based on DOSBox"
arch=('x86_64')
url="https://github.com/dosbox-staging/dosbox-staging"
license=('GPL-2.0-or-later')
depends=('sdl2-compat' 'sdl2_net' 'opusfile'  'alsa-lib' 'libpng' 'iir1' 'hicolor-icon-theme' 'speexdsp' 'libslirp' 'fluidsynth' 'munt' 'zlib-ng' 'libglvnd')
optdepends=('ncurses')
makedepends=('meson' 'ninja' 'cmake')
provides=("dosbox")
conflicts=("dosbox")
source=("https://github.com/dosbox-staging/dosbox-staging/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('387c97b373c3164ab5abbbc2b210bf94b5567057abe44ee1e8b4d4e725bd422c')

build() {
  arch-meson \
  -Dunit_tests=disabled \
  build "${pkgname}-${pkgver}"
}

package() {
  meson install -C build --destdir "$pkgdir" --skip-subprojects libpng

  install -Dm 644 "${pkgname}-${pkgver}/docs/README.video" "$pkgdir/usr/share/doc/${pkgname}/video.txt"
  install -Dm 644 "${pkgname}-${pkgver}/README" "$pkgdir/usr/share/doc/${pkgname}/manual.txt"
}
