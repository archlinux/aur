# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributer: Wouter Wijsman <wwijsman@live.nl>

pkgname=dosbox-staging
pkgver=0.82.2
pkgrel=1
epoch=1
pkgdesc="DOS/x86 emulator focusing on ease of use. Based on DOSBox"
arch=('any')
url="https://github.com/dosbox-staging/dosbox-staging"
license=('GPL-2.0-or-later')
depends=('sdl2' 'sdl2_net' 'opusfile'  'alsa-lib' 'libpng' 'iir1' 'sdl2_image' 'hicolor-icon-theme' 'speexdsp' 'libslirp' 'fluidsynth' 'munt' 'zlib-ng' 'libglvnd')
optdepends=('ncurses')
makedepends=('meson' 'ninja' 'gcc' 'gzip' 'git')
provides=("dosbox")
conflicts=("dosbox")
source=("git+https://github.com/dosbox-staging/dosbox-staging#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}"
  meson setup --prefix "/usr" build
  meson compile -C build
}

package() {
  cd "$srcdir/${pkgname}"

  meson install -C build --destdir "$pkgdir" --skip-subprojects libpng

  install -Dm 644 "docs/README.video" "$pkgdir/usr/share/doc/${pkgname}/video.txt"
  install -Dm 644 "README" "$pkgdir/usr/share/doc/${pkgname}/manual.txt"
}
