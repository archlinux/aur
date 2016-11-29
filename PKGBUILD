# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Überbacher <hollunder at gmx dot at>

_pkgbasename=qtractor
pkgname=${_pkgbasename}-git
pkgver=0.8.0.r0.gca80cfb
pkgrel=1
pkgdesc="Audio/MIDI multitrack sequencer"
arch=('i686' 'x86_64')
url="http://qtractor.sourceforge.net/"
license=('GPL')
depends=('qt5-x11extras' 'gtk2' 'suil' 'lilv' 'libmad' 'liblo' 'rubberband')
makedepends=('qt5-tools' 'ladspa' 'dssi')
optdepends=('dssi-vst: win32 VST support')
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
source=("${_pkgbasename}::git://github.com/rncbc/qtractor.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbasename}"
  # cutting off 'qtractor_' prefix that presents in the git tag + remaining underscores (it's ugly but gets the job done).
  git describe --long | sed 's/^qtractor_//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/\_/./g'
}

build() {
  cd "${srcdir}/${_pkgbasename}"
  make -f Makefile.git
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}"
  make DESTDIR="${pkgdir}" install
}

