# Maintainer: Victor A. Santos  <victoraur.santos@gmail.com>
pkgname=opensoundmeter
pkgver=1.4.1
pkgrel=1
pkgdesc="Crossplatform measurement software for tuning sound systems"
arch=('x86' 'x86_64')
url="https://opensoundmeter.com"
license=('GPL3')
depends=('alsa-lib' 'desktop-file-utils' 'qt5-base' 'qt5-declarative'
         'qt5-quickcontrols2' 'qt5-graphicaleffects')
makedepends=('qt5-base')
source=("https://github.com/psmokotnin/osm/archive/refs/tags/v1.4.1.tar.gz"
        "disable-appimage.patch")
md5sums=('3d344be9747eee1a41987cdfdf41a96a'
         '010792657489e32e28d4f22205bde460')

prepare() {
    cd "$srcdir/osm-${pkgver}"

    patch -N -i ../disable-appimage.patch
}

build() {
	cd "$srcdir/osm-${pkgver}"

	qmake-qt5 -o Makefile OpenSoundMeter.pro
	make
}

package() {
	cd "$srcdir/osm-${pkgver}"

	install -Dm755 OpenSoundMeter "$pkgdir/usr/bin/OpenSoundMeter"
	install -Dm644 OpenSoundMeter.desktop "$pkgdir/usr/share/applications/OpenSoundMeter.desktop"
}
