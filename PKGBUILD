# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Überbacher <hollunder at gmx dot at>

pkgname=qtractor-git
pkgver=0.8.0.r48.gc47acb11
pkgrel=3
pkgdesc="Audio/MIDI multitrack sequencer"
arch=("i686" "x86_64")
url="http://qtractor.sourceforge.net/"
license=("GPL")
depends=("liblo" "rubberband" "lilv" "qt5-x11extras" "gcc-libs-multilib" "gtk2" "suil" "libmad")
makedepends=("qt5-tools" "ladspa" "dssi")
optdepends=("dssi-vst: win32 VST support")
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git://github.com/rncbc/qtractor.git")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname%-*}"
  # cutting off the "qtractor_" prefix present in the git tag + remaining underscores (ugly but gets the job done).
  git describe --long | sed 's/^qtractor_//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/\_/./g'
}

build() {
  cd "${srcdir}/${pkgname%-*}"
  make -f Makefile.git
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname%-*}"
  make DESTDIR="${pkgdir}" install
}

