# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Nils Hilbricht <nils@hilbricht.net>
# Contributor: Christopher Arndt <osam -at- chrisarndt -dot- de>

pkgname=audiowmark
pkgver=0.6.2
pkgrel=1
pkgdesc='Audio and video watermarking'
arch=(x86_64 aarch64)
url='https://uplex.de/audiowmark/'
license=(GPL-3.0-or-later)
depends=(bash gcc-libs glibc libgcrypt)
makedepends=(ffmpeg fftw libsndfile mpg123 zita-resampler)
groups=(pro-audio)
source=("https://github.com/swesterfeld/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.zst")
sha256sums=('aacc80be9fca2c9462be51b1cf34d9194946876ae08c7bbb13c5c3b2d9621437')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-ffmpeg
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  depends+=(
    libsndfile.so
    libfftw3f.so
    libmpg123.so
    libavcodec.so
    libavformat.so
    libavutil.so
    libswresample.so
    libzita-resampler.so
  )
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 README.adoc -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 NEWS -t "$pkgdir"/usr/share/licenses/$pkgname
}
