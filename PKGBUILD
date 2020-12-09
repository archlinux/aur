# Maintainer: Midov <midov@midov.pl>

pkgname=matrix-mirage-git
_name=mirage
pkgver=r2303.17a8e1ce
pkgrel=2
pkgdesc='A fancy, customizable, keyboard-operable Matrix chat client for encrypted and decentralized communication.'
arch=('any')
url='https://github.com/mirukana/mirage'
license=('LGPL3')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-graphicaleffects' 'qt5-imageformats' 'python' 'python-pyotherside' 'libolm' 'libjpeg-turbo' 'zlib' 'libtiff' 'libwebp' 'openjpeg2' 'libmediainfo' 'python-pillow' 'python-pymediainfo' 'python-cairosvg' 'python-aiofiles' 'python-appdirs' 'python-filetype' 'python-html-sanitizer' 'python-lxml' 'python-mistune' 'python-blist' 'python-matrix-nio>=0.15.0' 'libxss' 'python-plyer' 'python-sortedcontainers')
makedepends=('cmake' 'git')
conflits=('mirage' 'mirage-matrix' 'matrix-mirage')
source=("git://github.com/mirukana/${_name}.git")
sha256sums=('SKIP')

prepare() {
        cd ${srcdir}/"${_name}"
	git checkout dev
	git submodule update --init --recursive
}
pkgver() {
        cd ${srcdir}/"${_name}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}
build() {
        cd ${srcdir}/"${_name}"
	qmake PREFIX=/usr mirage.pro
	make
}
package() {
        cd ${srcdir}/"${_name}"
	make INSTALL_ROOT="${pkgdir}" install 
}
