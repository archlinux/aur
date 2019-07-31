# Maintainer: Alison Watson <marrub@greyserv.net>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Corey Richardson <corey@octayn.net>

pkgname=krita-git
pkgver=4.3.0.prealpha.97.gcec15055b8
pkgrel=1
pkgdesc="Edit and paint images (git version)"
arch=(x86_64)
url="http://krita.org"
license=(GPL3)
depends=(kitemviews kitemmodels ki18n kcompletion karchive kguiaddons kcrash
         qt5-svg qt5-multimedia quazip gsl libraw exiv2 openexr fftw curl
         boost-libs giflib hicolor-icon-theme desktop-file-utils)
makedepends=(extra-cmake-modules kdoctools boost eigen vc poppler-qt5
             opencolorio python-pyqt5 libheif sip python-sip)
optdepends=('poppler-qt5: PDF filter' 'ffmpeg: to save animations'
            'opencolorio: for the LUT docker' "krita-plugin-gmic: G'MIC plugin"
            'python-pyqt5: for the Python plugins' 'libheif: HEIF filter')
conflicts=(calligra-krita krita-il10n krita)
replaces=(calligra-krita krita-il10n krita)
source=("git+https://github.com/KDE/krita.git")
sha256sums=('SKIP')

pkgver() {
	cd krita
	git describe --tags |sed 's+-+.+g'|sed 's+^v++'
}

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../krita \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DBUILD_TESTING=OFF
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
