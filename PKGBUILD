# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=flac2all
pkgver=5.5
pkgrel=1
pkgdesc="Multi-threaded audio converter of FLAC to either Ogg Vorbis or MP3 retaining all tags and metadata."
arch=('any')
url="https://github.com/ZivaVatra/flac2all"
license=('GPL2')
makedepends=('python' 'python-setuptools')
depends=('flac' 'python-importlib-metadata' 'python-pyzmq')
optdepends=(
'faad2: for AAC support'
'ffmpeg: for supporting all the audio encoders it supports'
'lame: for mp3 support'
'opus-tools: for opus support'
'python-curses-menu: for the curses interface'
'python-pyzmq: for clustering'
'vorbis-tools: for ogg support'
)
_pkgver=test.v5.5
#source=("$pkgname-$pkgver.tar.gz::https://github.com/ZivaVatra/$pkgname/archive/v$pkgver.tar.gz"
source=("$pkgname-5.5.tar.gz::https://github.com/ZivaVatra/$pkgname/archive/$_pkgver.tar.gz"
pr51.patch::https://patch-diff.githubusercontent.com/raw/ZivaVatra/flac2all/pull/51.patch
)
sha256sums=('b5299f5e079a4c882de48c9c8353d648afaa0f403dde851b333ad3a8aa19e271'
            'fdf5692be972e83d1a803a10007227dad7d039d3c2b97deec2ef4ddc067693e9')

prepare() {
  cd "$pkgname-$_pkgver"
  patch -Np1 -i ../pr51.patch
}

build() {
  cd "$pkgname-$_pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$_pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

