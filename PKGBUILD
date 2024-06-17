# Maintainer: Robert Mandic <sir.mandic@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=gpac
pkgname=$_pkgname-git
pkgver=2.4.0.r288.g760b68c19
pkgrel=1
pkgdesc="A multimedia framework based on the MPEG-4 Systems standard (git version)"
arch=('i686' 'x86_64')
url="https://gpac.wp.imt.fr/"
license=('LGPL2.1')
depends=('faad2' 'ffmpeg' 'a52dec' 'libmad' 'python-setuptools' 'pipewire-jack')
makedepends=('alsa-lib' 'freetype2' 'git' 'libjpeg-turbo' 'libpng' 'libogg' 'libpulse' 'libtheora' 'libvorbis' 'mesa' 'sdl2' 'xvidcore' 'zlib')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(git+https://github.com/gpac/gpac.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --tags --long | sed -E 's/v([^-]+)-([0-9]+)-g([0-9a-f]+)/\1.r\2.g\3/'
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
