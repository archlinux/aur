# Maintainer: Klaus Fröhlich <arch@sclause.net>

pkgname=grandorgue-git
pkgver=1.0
_branch=master
pkgrel=1
pkgdesc='git-version of the Virtual Pipe Organ GrandOrgue'
arch=('i686' 'x86_64')
url='https://github.com/e9925248/grandorgue'
license=('GPL')
depends=(fftw
  wavpack
  wxgtk2
  alsa-lib
  libglvnd
  jack)
makedepends=(cmake
  git
  docbook-xsl
  zip
  po4a
  gettext)
#optdepends=('lame: MP3 export')
#install=musescore.install
source=("git+$url.git#branch=$_branch")
md5sums=('SKIP')

pkgver() {
  cd grandorgue
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  if [ ! -d gobuild ]; then
    mkdir gobuild
  fi
  cd gobuild
  cmake -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX="/usr" \
   -G "Unix Makefiles" ../grandorgue
  make
}

package() {
  cd gobuild
  make DESTDIR="${pkgdir}" SUFFIX="-git" LABEL="Git Build" install
}

