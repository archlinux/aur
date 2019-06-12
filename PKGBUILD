# Maintainer: Klaus Fröhlich <arch@sclause.net>

pkgname=grandorgue-git
pkgver=2019.03.31.00.00.00
_branch=master
pkgrel=1
pkgdesc='git-version of the Virtual Pipe Organ Software GrandOrgue'
arch=('i686' 'x86_64')
url='https://github.com/e9925248/grandorgue'
license=('GPL2+')
depends=(fftw
  wavpack
  wxgtk2
  alsa-lib
  libglvnd
  jack
  zlib
  libsystemd)
makedepends=(gcc
  cmake
  git
  docbook-xsl
  zip
  po4a
  gettext)
source=("git+$url.git#branch=$_branch")
md5sums=('SKIP')

pkgver() {
  cd grandorgue
  git log -1 --pretty=%aI | sed 's/\+.*//g;s/[^0-9]/\./g'
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

