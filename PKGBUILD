# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=flac2all
pkgver=5.0
pkgrel=2
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
01-unfuck_python3.patch::https://github.com/ZivaVatra/flac2all/commit/dfe6d201d57866905dabf6bbcae4d396e4e4d130.patch
)
sha256sums=('d18a01653eed4d497cc1fe0393fecfaf6b6eab5dac9bd5599d1e83231b76c22d'
            '2ad929c76351bcb63782ce06c45db62abfad6191be498914abaf17321e71479c')

prepare() {
  cd "$pkgname-$pkgver"
  [[ -f version ]] || echo "v$pkgver" > version
  patch -Np1 -i ../01-unfuck_python3.patch
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

