# Maintainer: Robert Mandic <sir.mandic@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=gpac
pkgname=$_pkgname-git
pkgver=2.2.0.r35.gbbca86917
pkgrel=1
pkgdesc="A multimedia framework based on the MPEG-4 Systems standard (git version)"
arch=('i686' 'x86_64')
url="https://gpac.wp.imt.fr/"
license=('LGPL2.1')
depends=('faad2' 'ffmpeg' 'a52dec' 'libmad' 'python-setuptools')
makedepends=('alsa-lib' 'freetype2' 'git' 'jack2' 'libjpeg-turbo' 'libpng' 'libogg' 'libpulse' 'libtheora' 'libvorbis' 'mesa' 'sdl2' 'xvidcore' 'zlib')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(git+https://github.com/gpac/gpac.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
  )
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" -j1 install install-lib
}
