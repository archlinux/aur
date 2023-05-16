# Maintainer: Midov <midov@midov.pl>
# Maintainer: linuxoid <linuxoidlinuxoidovich@gmail.com>

pkgname=matrix-mirage
_name=mirage
pkgver=0.7.2
pkgrel=2
pkgdesc='A fancy, customizable, keyboard-operable Matrix chat client for encrypted and decentralized communication.'
arch=('any')
url='https://github.com/mirukana/mirage'
license=('LGPL3')
depends=('python' 'qt5-declarative' 'qt5-quickcontrols2' 'libx11' 'hicolor-icon-theme' 'glibc' 'libxss' 'gcc-libs' 'libglvnd' 'qt5-base')
makedepends=('cmake' 'git')
conflicts=('mirage-matrix' 'matrix-mirage-git')
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
