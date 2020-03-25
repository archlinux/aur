# Maintainer: Whemoon Jang <palindrom615@gmail.com>
# Contributor: Youngbin Han <sukso96100@gmail.com>
# Contributor: Changjoo Lee <icj7061@gmail.com>
# Contributor: ywen407 <ywen407@naver.com>
pkgname=nimf-git
pkgver=1.2.0.r17.44dcd8c
pkgrel=1
epoch=1
pkgdesc='Nimf is a lightweight, fast and extensible input method framework.'
arch=('i386' 'x86_64')
url="https://github.com/hamonikr/nimf"
license=('LGPL3')
groups=()
depends=(
	'glib2'
	'gtk3'
	'libxklavier'
	'libxkbcommon>=0.5.0'
	'libappindicator-gtk3'
)
makedepends=(
	'git'
	'meson'
	'ninja'
	'gcc'
	'gtk2'
	'gtk-doc'
	'gtk-update-icon-cache'
	'librsvg'
	'anthy'
	'libhangul>=0.0.12'
	'm17n-db>=1.7.0'
	'm17n-lib>=1.7.0'
	'librime>=1.2.9'
	'libx11'
	'wayland-protocols'
	'wayland'
	'qt5-base'
)
optdepends=('qt4: qt4 support')
provides=("nimf")
conflicts=("nimf")
options=()
install=
source=("${pkgname%-git}::git+$url.git#branch=meson-build")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	meson setup build --buildtype=release --prefix="/usr"  -Dwith_nimf_qt4=false
	ninja -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	DESTDIR="$pkgdir/" ninja -C build install
}
