# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributer: Wouter Wijsman <wwijsman@live.nl>

pkgname=dosbox-staging
pkgver=0.81.0
pkgrel=2
epoch=1
pkgdesc="DOS/x86 emulator focusing on ease of use. Based on DOSBox"
arch=('any')
url="https://github.com/dosbox-staging/dosbox-staging"
license=('GPL2')
depends=('sdl2' 'sdl2_net' 'opusfile'  'alsa-lib' 'libpng' 'iir1' 'sdl2_image' 'hicolor-icon-theme' 'speexdsp' 'libslirp' 'fluidsynth' 'munt')
optdepends=('ncurses')
makedepends=('meson' 'ninja' 'gcc' 'gzip')
provides=("dosbox")
conflicts=("dosbox")
source=("https://github.com/dosbox-staging/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9b133dbf2fe8410bb475267a8f26844d56b9025079783ec6a4574841888ae600')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  meson setup --prefix "/usr" build
  meson compile -C build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  meson install -C build --destdir "$pkgdir" --skip-subprojects libpng

  install -Dm 644 "docs/README.video" "$pkgdir/usr/share/doc/${pkgname}/video.txt"
  install -Dm 644 "README" "$pkgdir/usr/share/doc/${pkgname}/manual.txt"
}
