# Contributor: Nils Werner <nils DOT werner AT gmail DOT com>
pkgname='essentia'
pkgver=2.0.1
pkgrel=2
pkgdesc="Open-source C++ library for audio analysis and audio-based music information retrieval"
url="http://essentia.upf.edu/"
arch=('x86_64')
license=('GPL')
depends=('python2' 'python2-numpy' 'libyaml' 'python2-yaml' 'fftw' 'ffmpeg' 'taglib' 'libsamplerate')
source=(https://github.com/MTG/essentia/archive/$pkgver.zip)
md5sums=('026b2f1b1c120f6cf5b1998e4262521b')

build() {
    cd "$srcdir/$pkgname-$pkgver/"
    PYTHON=/usr/bin/python2 python2 waf configure --mode=release --with-python --with-vamp --prefix=/usr/
    PYTHON=/usr/bin/python2 python2 waf --prefix=/usr/
}

package() {
    cd "$srcdir/$pkgname-$pkgver/"
    PYTHON=/usr/bin/python2 DESTDIR=$pkgdir python2 waf install --prefix=/usr/ || return 1 
}
