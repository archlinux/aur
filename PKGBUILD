# Maintainer: Bruce Zhang
pkgname=plasma-ions-china-git
pkgver=r117.9ecdb47
pkgrel=1
pkgdesc="A collection of plasma weather ions for Chinese users. "
arch=('x86_64')
url="https://github.com/arenekosreal/plasma-ions-china"
license=('GPL-3.0-or-later')
depends=('qt6-base')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'gettext' 'plasma-workspace' 'kdeplasma-addons>=6.5')
optdepends=()
provides=('plasma-ions-china')
conflicts=('plasma-ions-china')
source=('plasma-ions-china::git+https://github.com/arenekosreal/plasma-ions-china.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/plasma-ions-china"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/plasma-ions-china"
	cmake -B build -S . -DCMAKE_BUILD_TYPE=Release -DPlasmaWeather_ROOT="$srcdir/plasma-ions-china"
	cmake --build  build
}

package() {
	cd "$srcdir/plasma-ions-china"
	DESTDIR="$pkgdir" cmake --install build
}
