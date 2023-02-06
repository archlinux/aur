# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributer: Wouter Wijsman <wwijsman@live.nl>

pkgname=dosbox-staging
pkgver=0.80.1
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
source=(
  "https://github.com/dosbox-staging/${pkgname}/archive/v${pkgver}.tar.gz"
)
sha256sums=('2ca69e65e6c181197b63388c60487a3bcea804232a28c44c37704e70d49a0392')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  meson setup --prefix "/usr" build
  meson compile -C build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  meson install -C build --destdir "$pkgdir"

  install -Dm 644 "docs/README.video" "$pkgdir/usr/share/doc/${pkgname}/video.txt"
  install -Dm 644 "README" "$pkgdir/usr/share/doc/${pkgname}/manual.txt"
}
