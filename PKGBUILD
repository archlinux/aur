# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Überbacher <hollunder at gmx dot at>

_pkgname=qtractor
pkgname=$_pkgname-git
pkgver=qtractor_0_8_0.r0.gca80cfb
pkgrel=1
pkgdesc="Audio/MIDI multitrack sequencer"
arch=('i686' 'x86_64')
url="http://qtractor.sourceforge.net/"
license=('GPL')
depends=('qt5-x11extras' 'gtk2' 'suil' 'lilv' 'libmad' 'liblo' 'rubberband')
makedepends=('qt5-tools' 'ladspa' 'dssi')
optdepends=('dssi-vst: win32 VST support')
provides=(qtractor)
conflicts=(qtractor)
source=("$_pkgname::git://github.com/rncbc/qtractor.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'

}

build() {
  cd "${srcdir}/${_pkgname}"
  make -f Makefile.git
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}

