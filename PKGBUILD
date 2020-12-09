# Maintainer: Midov <midov@midov.pl>

pkgname=matrix-mirage
_name=mirage
pkgver=0.6.4
pkgrel=2
pkgdesc='A fancy, customizable, keyboard-operable Matrix chat client for encrypted and decentralized communication.'
arch=('any')
url='https://github.com/mirukana/mirage'
license=('LGPL3')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-graphicaleffects' 'qt5-imageformats' 'python' 'python-pyotherside' 'libolm' 'libjpeg-turbo' 'zlib' 'libtiff' 'libwebp' 'openjpeg2' 'libmediainfo' 'python-pillow>=7.00' 'python-pymediainfo' 'python-cairosvg' 'python-aiofiles>=0.4.0' 'python-appdirs>=1.4.4' 'python-filetype' 'python-html-sanitizer' 'python-lxml' 'python-mistune>=0.8.4' 'python-blist' 'python-matrix-nio>=0.15.0' 'libxss' 'python-sortedcontainers')
makedepends=('cmake' 'git')
conflits=('mirage' 'mirage-matrix' 'matrix-mirage-git')
source=("git://github.com/mirukana/${_name}.git")
sha256sums=('SKIP')

prepare() {
        cd ${srcdir}/"${_name}"
	git checkout tags/v"${pkgver}"
	git submodule update --init --recursive
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
