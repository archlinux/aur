# Maintainer: Mark Wagie <mark dot wagie at tutantota dot com>
# Contributor: Federico Di Pierro <nierro92@gmail.com>
pkgname=clight
pkgver=4.4
pkgrel=5
pkgdesc="A C daemon that turns your webcam into a light sensor. It can also change display gamma temperature, dim your screen and set your dpms."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/FedeDP/Clight"
license=('GPL')
depends=('clightd' 'gsl' 'hicolor-icon-theme' 'libconfig' 'popt')
makedepends=('git' 'cmake' 'bash-completion')
optdepends=('geoclue: to retrieve user location through geoclue.'
            'upower: to save energy by increasing timeouts between captures while on battery
             and to autocalibrate keyboard backlight.'
            'bash-completion: to add support for bash automatic completion.'
            'clight-gui: Clight GUI written in Qt.')
backup=("etc/default/$pkgname.conf")
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('1371ac6f537cec4fc61581dbb6ceb143df08f20e24f884fa148068008864b054')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-G "Unix Makefiles" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
