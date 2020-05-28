#

pkgname=tubeamp-designer-git
pkgver=1.2.r0.g227b034
pkgrel=1
pkgdesc="Standalone software guitar processor, editor of *.tapf profile files for tubeAmp (KPP) and guitar amp profiler."
arch=('x86_64')
url="https://github.com/olegkapitonov/tubeAmp-Designer"
license=('GPL3')
groups=()
depends=(
'cairo' 'fftw' 'zenity' 'zita-convolver' 'zita-resampler'
'qt5-base' 'qt5-tools' 'jack' 'gsl'
)
makedepends=('git' 'lv2' 'boost' 'meson' 'faust' 'xcb-util' 'xcb-util-wm')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+${url}")
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

