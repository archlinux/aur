# Maintainer: linuxoid <linuxoidlinuxoidovich@gmail.com>

pkgname=matrix-mirage-python3.10
_name=mirage
pkgver=0.7.2
pkgrel=2
pkgdesc='A fancy, customizable, keyboard-operable Matrix chat client for encrypted and decentralized communication. For python 3.10.'
arch=('any')
url='https://github.com/mirukana/mirage'
license=('LGPL3')
depends=('unzip' 'qt5-base' 'qt5-declarative' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-graphicaleffects' 'qt5-imageformats' 'python' 'python-pyotherside' 'libolm' 'libjpeg-turbo' 'zlib' 'libtiff' 'libwebp' 'openjpeg2' 'libmediainfo' 'python-pillow' 'python-pymediainfo' 'python-cairosvg' 'python-aiofiles' 'python-appdirs' 'python-filetype' 'python-html-sanitizer' 'python-lxml' 'python-mistune1' 'python-blist' 'python-matrix-nio>=0.17.0' 'libxss' 'python-plyer' 'python-sortedcontainers' 'python-watchgod' 'python-redbaron' 'python-dbus' 'python-hsluv' 'python-pycryptodome' 'python-simpleaudio')
makedepends=('cmake' 'git')
conflicts=('matrix-mirage' 'mirage-matrix' 'matrix-mirage-git')
source=("https://raw.githubusercontent.com/vSLG/mirage/4cffbaa68da1feb9254dcd064de66ae93045a785/src/backend/utils.py" "git+https://github.com/mirukana/mirage")
sha256sums=('SKIP' 'SKIP')

prepare() {
	#git clone https://github.com/mirukana/mirage
	mv utils.py mirage/src/backend/utils.py
        cd mirage
	git submodule update --init --recursive
}

build() {
        cd mirage
	qmake PREFIX=/usr mirage.pro
	make
}

package() {
        cd mirage
	make INSTALL_ROOT="${pkgdir}" install 
}
