# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-shell
pkgver=0.6.90.20160327
pkgrel=1
pkgdesc="Hawaii Shell"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://hawaiios.org'
license=('GPL', 'LGPL')
depends=('qt5-tools' 'qt5-quickcontrols' 'qt5-graphicaleffects' 'qt5-svg'
         'greenisland' 'pam' 'libpulse' 'libqtxdg' 'glib2' 'networkmanager-qt'
         'hawaii-icon-theme' 'hawaii-wallpapers' 'libhawaii' 'fluid' 'solid'
         'ttf-dejavu' 'ttf-droid')
optdepends=('weston: nested mode support'
            'pulseaudio: audio support'
            'networkmanager: networking support')
makedepends=('gdb' 'extra-cmake-modules')
conflicts=('hawaii-shell-git')
groups=('hawaii')
options=('debug')
#source=("https://github.com/hawaii-desktop/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
source=("https://codeload.github.com/hawaii-desktop/${pkgname}/legacy.tar.gz/5a84205994497c7a603074e7ad5120af4e9f4038")
sha1sums=('c4f6f2cce7d1d8ee328c18e7986a0b29e4f65da2')

prepare() {
	mkdir -p build
}

build() {
	cd build
	#cmake ../${pkgname}-${pkgver} \
	cmake ../hawaii-desktop-hawaii-shell-5a84205 \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=lib \
		-DLIBEXEC_INSTALL_DIR=lib \
		-DQML_INSTALL_DIR=lib/qt/qml \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
