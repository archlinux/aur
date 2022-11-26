# Maintainer: ObserverOfTime <chronobserver@disroot.org>
# based on mkvtoolnix-{cli,gui}

pkgname=mkvtoolnix-qt5
pkgver=72.0.0
pkgrel=1
pkgdesc='Matroska tools (Qt5 version)'
arch=('x86_64')
url='https://mkvtoolnix.download/'
license=('GPL2')
depends=(
  'boost-libs'
  'curl'
  'file'
  'flac'
  'libogg'
  'libvorbis'
  'lzo'
  'qt5-base'
  'zlib'
)
makedepends=(
  'boost'
  'cmark'
  'docbook-xsl'
  'git'
  'libdvdread'
  'libxslt'
  'po4a'
  'qt5-multimedia'
  'qt5-svg'
  'ruby-rake'
)
optdepends=(
  'libebml: instead of the bundled lib'
  'libmatroska: instead of the bundled lib'
)
provides=("mkvtoolnix-cli=${pkgver}" "mkvtoolnix-gui=${pkgver}")
conflicts=('mkvtoolnix-cli' 'mkvtoolnix-gui' 'mkvtoolnix-git')
source=("https://mkvtoolnix.download/sources/mkvtoolnix-${pkgver}.tar.xz")
sha256sums=('3bd1005baf397f1d70619c2f2c52af9de8ce75995830e790e429c0943fd08000')

build() {
  cd mkvtoolnix-${pkgver}
  ./configure \
    --prefix=/usr \
    --disable-update-check
  rake $MAKEFLAGS
}

package() {
  cd mkvtoolnix-${pkgver}
  rake DESTDIR="${pkgdir}" install
}
