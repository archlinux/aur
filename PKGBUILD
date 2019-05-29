# Maintainer: Manuel Stoeckl <com dоt mstoeckl аt wppkgb>
pkgname=waypipe-git
pkgver=0.1.0.r0.g93945dd
pkgrel=1
pkgdesc='A proxy for Wayland protocol applications. WARNING: very unstable'
license=('MIT')
depends=('libffi' 'wayland')
optdepends=('openssh: recommended transport')
makedepends=('git' 'meson' 'ninja' 'scdoc' 'wayland-protocols')
url='https://gitlab.freedesktop.org/mstoeckl/waypipe'
source=('git+https://gitlab.freedesktop.org/mstoeckl/waypipe.git')
sha512sums=('SKIP')
options=(debug !strip)
arch=('any')

pkgver() {
    cd waypipe
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd waypipe
	meson --buildtype debugoptimized -Dwerror=false --prefix /usr "$srcdir/build"
}

build() {
	cd waypipe
	ninja -C "$srcdir/build"
}

package() {
	cd waypipe
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}
