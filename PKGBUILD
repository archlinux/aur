# Maintainer: Jokler <jokler.contact@gmail.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
pkgname='jp2a-git'
_gitname='jp2a'
pkgver=v1.0.9.r24.g5859335
pkgrel=1
pkgdesc='A small utility for converting JPG images to ASCII'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/Talinx/jp2a'
provides=('jp2a')
conflicts=('jp2a')
license=('GPL')
depends=('curl' 'libjpeg' 'libpng')
makedepends=('git' 'autoconf-archive')
source=('git+https://github.com/Talinx/jp2a#branch=develop')
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/jp2a"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "${_gitname}"
  autoreconf -vi
}

build(){
  cd "${_gitname}"
  ./configure --prefix='/usr'
  make
}

check() {
  cd "${_gitname}"
  make check
}

package(){
  cd "${_gitname}"
  make DESTDIR="${pkgdir}" install
}
