# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=flac2all
pkgver=5.1
pkgrel=1
pkgdesc="Multi-threaded audio converter of FLAC to either Ogg Vorbis or MP3 retaining all tags and metadata."
arch=('any')
url="https://github.com/ZivaVatra/flac2all"
license=('GPL2')
makedepends=('python' 'python-setuptools')
depends=('flac' 'python-importlib-metadata')
optdepends=(
'faad2: for AAC support'
'ffmpeg: for supporting all the audio encoders it supports'
'lame: for mp3 support'
'opus-tools: for opus support'
'python-curses-menu: for the curses interface'
'python-pyzmq: for clustering'
'vorbis-tools: for ogg support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ZivaVatra/$pkgname/archive/v$pkgver.tar.gz"
)
sha256sums=('32ffb53068d4e5b766ac66c7988170e84d8368648fcb671ebf4a168a5b03a391')

prepare() {
  cd "$pkgname-$pkgver"
  [[ -f version ]] || echo "v$pkgver" > version
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

