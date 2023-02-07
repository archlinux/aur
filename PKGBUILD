# Maintainer: ObserverOfTime <chronobserver@disroot.org>
# based on mkvtoolnix-{cli,gui}

pkgname=mkvtoolnix-qt5
pkgver=73.0.0
pkgrel=1
pkgdesc='Matroska tools (Qt5 version)'
arch=('x86_64')
url='https://mkvtoolnix.download/'
license=('GPL2')
depends=(
  'boost-libs'
  'cmark'
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
sha256sums=('f31a129723571b46a974bc5d57d73733c1245ee429afd6ddaf274038e94e2280')

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
