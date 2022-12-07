# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Nils Hilbricht <nils@hilbricht.net>

pkgname=audiowmark
pkgver=0.6.1
pkgrel=2
pkgdesc='Audio and video watermarking'
arch=(x86_64 aarch64)
url='https://uplex.de/audiowmark/'
license=(GPL3)
#depends=(fftw libsndfile libgcrypt zita-resampler mpg123 ffmpeg) #explicit from README
depends=(zita-resampler fftw ffmpeg mpg123) #as namcap sees them
groups=(pro-audio)
checkdepends=(bash)
source=("$url/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('0b22c4364e111f6a70dac0118a1f67319bce25e57c501d5e55918cdb0c2577fb')

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
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 README.adoc -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 NEWS -t "$pkgdir"/usr/share/licenses/$pkgname
}
