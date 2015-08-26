# Maintainer: flu

I_WANT_WEBM_SUPPORT=yes


#---------------

_name=pqiv
pkgname=$_name-git
pkgver=2.3.r37.gac5de03
pkgrel=1
pkgdesc="Modern rewrite of Quick Image Viewer - development version"
arch=('i686' 'x86_64')
url="https://github.com/phillipberndt/pqiv/"
license=('GPL3')
provides=("$_name")
conflicts=("$_name")
depends=('gtk3')
#depends=('gtk2')
makedepends=('git')
optdepends=(
  'libspectre: PS/EPS support'
  'poppler: PDF support'
  'imagemagick: additional image formats like psd'
)

if [ $I_WANT_WEBM_SUPPORT = yes ]; then
  optdepends+=('ffmpeg: basic video support e.g. WEBM')
fi

source=(git+https://github.com/phillipberndt/pqiv)
sha256sums=(SKIP)

pkgver() {
  cd   "$srcdir"/"$_name"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_name
  
  if [ $I_WANT_WEBM_SUPPORT = yes ]; then
    ./configure --with-libav

  else
    ./configure

  fi

  make
}

package() {
  cd $_name
  make DESTDIR=$pkgdir install
}
