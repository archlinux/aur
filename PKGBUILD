# Maintainer: Klaus Fröhlich <arch@sclause.net>

pkgname=grandorgue-svn
pkgver=r2333
pkgrel=1
pkgdesc='svn-version of the Virtual Pipe Organ Software GrandOrgue'
arch=('i686' 'x86_64')
url='https://svn.code.sf.net/p/ourorgan/svn/trunk/'
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
  subversion
  docbook-xsl
  zip
  po4a
  gettext)
replaces=('grandorgue-git')
source=("$pkgname::svn+$url#revision=$pkgver")
md5sums=('SKIP')

build() {
  if [ ! -d gobuild ]; then
    mkdir gobuild
  fi
  cd gobuild
  cmake -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX="/usr" \
   -G "Unix Makefiles" "../$pkgname"
  make
}

package() {
  cd gobuild
  make DESTDIR="${pkgdir}" SUFFIX="-svn" LABEL="SVN Build" install
}


