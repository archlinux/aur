# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=kapitonov-plugins-pack-lv2-git
pkgver=v1.0.r24.g345313f
pkgrel=1
pkgdesc="Kapitonov Plugins Pack (KPP) - Set of plugins for guitar sound processing. "
arch=('x86_64')
url="https://github.com/olegkapitonov/Kapitonov-Plugins-Pack"
license=('GPL3')
groups=('lv2-plugins')
depends=('cairo' 'fftw' 'zenity' 'zita-convolver' 'zita-resampler')
makedepends=('git' 'lv2' 'boost' 'meson' 'faust' 'xcb-util' 'xcb-util-wm')
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
	meson setup builddir -Dladspa=disabled --prefix=/usr
	ninja -C builddir
}

package() {
	cd "$srcdir/${pkgname%-*}"
	DESTDIR="$pkgdir/" ninja -C builddir install
}

