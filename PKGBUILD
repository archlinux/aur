# Maintainer: Andrew Lin <andrewlin16 at gmail dot com>
# Previous maintainer: Ian D. Scott <ian@perebruin.com>

pkgname=zxtune-git
pkgver=r5021.r22.g7a40db5c8
pkgrel=1
pkgdesc="Portable toolkit for ZX-Spectrum music playing"
arch=('i686' 'x86_64')
url="http://zxtune.bitbucket.io"
license=('GPL3')
depends=('boost-libs' 'gcc-libs' 'qt4' 'zlib')
optdepends=(
'alsa-lib: for ALSA output support'
'lame: for conversion to .mp3 format'
'libvorbis: for conversion to .ogg format'
'flac: for conversion to .flac format'
'curl: for accessing data via network schemes'
)
makedepends=('git' 'gcc' 'zip' 'boost')
provides=('zxtune')
conflicts=('zxtune-bin')
options=(!strip !docs !libtool !emptydirs !zipman makeflags)
source=('git+https://bitbucket.org/zxtune/zxtune.git')
md5sums=('SKIP')
_qt4_options="qt.includes=/usr/include/qt4 tools.uic=uic-qt4 tools.moc=moc-qt4 tools.rcc=rcc-qt4"

pkgver() {
  cd zxtune
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/zxtune"
  make platform=linux system.zlib=1 release=1 ${_qt4_options} -C apps/bundle
}

package() {
  cd "${srcdir}/zxtune"
  make DESTDIR="${pkgdir}" platform=linux release=1 install_linux -C apps/bundle
}
