# Maintainer: Sungjoon Moon <sumoon at seoulsaram dot org>
pkgname=ffglitch
pkgver=0.10.2
pkgrel=1
pkgdesc="FFmpeg fork for glitching"
arch=("x86_64")
url="https://ffglitch.org"
license=("GPL-3.0-only")
depends=('alsa-lib' 'libdrm' 'libxcb' 'zlib' 'libxau' 'libxdmcp' 'sdl2')
makedepends=('nasm')
conflicts=('quickjs')
source=('https://ffglitch.org/pub/src/ffglitch-0.10.2.tar.xz')
sha256sums=('7aecbbd4ce1b042846e43038be8b4cab16616505279d5310d33d16aa425ba46e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --disable-doc --enable-gpl --enable-static --disable-shared --disable-autodetect --disable-iconv --enable-zlib --enable-libxvid --enable-rtmidi --enable-libzmq --enable-sdl2 --enable-libxcb --enable-libdrm
  make
  make qjs
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 ffedit -t ${pkgdir}/usr/bin/
  install -Dm755 ffgac -t ${pkgdir}/usr/bin/
  install -Dm755 fflive -t ${pkgdir}/usr/bin/
  install -Dm755 qjs -t ${pkgdir}/usr/bin/
}
