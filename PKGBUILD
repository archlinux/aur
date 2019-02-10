# Maintainer: Antti Hautaniemi <an7oine at me com>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# This package is forked from community/gpac; original contributors:
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gpac-headless
pkgver=0.5.2.r3817.g8b9f06546
pkgrel=1
epoch=1
pkgdesc="MPEG-4 multimedia framework, headless version for server deployment"
arch=('i686' 'x86_64' 'armv6h')
url="https://gpac.wp.imt.fr/"
license=('LGPL')
depends=('ffmpeg' 'openssl')
makedepends=('git' 'jack' 'a52dec' 'freetype2' 'faad2' 'libmad')
optdepends=('jack: for jack support'
            'a52dec: for A52 support'
            'faad2: for AAC support'
            'libmad: for mp3 support')
provides=("gpac")
conflicts=("gpac")
source=(git+https://github.com/gpac/gpac.git)
sha256sums=('SKIP')

pkgver() {
  cd gpac
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
  )
}

build() {
  cd gpac
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --use-js=no \
    --disable-x11
  make
}

package() {
  make -C gpac DESTDIR="$pkgdir" -j1 install install-lib
}
