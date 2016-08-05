# Maintainer: Fabio Arnold <fabio at fabioarnold dot de>

_pkgname=twotris
_version=git

pkgname=${_pkgname}-${_version}
pkgver=0.1
pkgrel=1
pkgdesc="Edit fragment shaders and view changes in realtime"
arch=('x86_64' 'i686')
url="https://github.com/fabioarnold/TwoTriangles"
license=('MIT')
groups=()
depends=('gtk3' 'glew' 'sdl2')
makedepends=('pkg-config' 'scons')
optdepends=()
provides=('twotris')
conflicts=('twotris')
replaces=()
backup=()
options=()
install=${_pkgname}.install
changelog=
source=("git+${url}.git"
"${_pkgname}.desktop"
"${_pkgname}.svg")
sha256sums=('SKIP'
'0cae987cc78944940676f157e4edd002e07bf1391ca27d8ecdeea82729eb61a5'
'5887528710fe01ebc498965fe6f6d76b490eafaebab4dfafca2d2d2c8ac56934')
noextract=()

prepare() {
	cd $srcdir/TwoTriangles
	git submodule init
	git submodule update
}

build() {
	cd $srcdir/TwoTriangles
	sh build.sh release
}

package() {
	cd $srcdir
	install -Dm755 "TwoTriangles/build/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
	install -Dm644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "${_pkgname}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
	install -Dm644 "TwoTriangles/LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
}
