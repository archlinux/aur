# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=kapitonov-plugins-pack-lv2-git
pkgver=v1.0.r7.g6c9d469
pkgrel=1
pkgdesc="Kapitonov Plugins Pack (KPP) - Set of plugins for guitar sound processing. "
arch=('x86_64')
url="https://github.com/olegkapitonov/Kapitonov-Plugins-Pack"
license=('GPL3')
groups=('lv2-plugins')
depends=('cairo' 'fftw')
makedepends=('git' 'lv2' 'boost')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/olegkapitonov/Kapitonov-Plugins-Pack")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-*}"
	git submodule init
	git submodule update
	make
}

package() {
	cd "$srcdir/${pkgname%-*}"
	make DESTDIR="$pkgdir/" install PREFIX=/usr
}

