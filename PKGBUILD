# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=newbreeze-git
pkgver=v3.rc2.r21.5422ac8
pkgrel=1
pkgdesc="A fast and light-weight file manager based on Qt"
arch=('x86_64')
url="https://gitlab.com/marcusbritanicus/NewBreeze"
license=('GPL')
depends=('qt5-base' 'qt5-webengine' 'poppler' 'vlc' 'djvulibre' 'poppler-qt5' 'ffmpegthumbnailer')
makedepends=('git' 'qt5-base' 'qscintilla-qt5') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
source=('git+https://gitlab.com/marcusbritanicus/NewBreeze.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	PREFIX="/usr" qmake-qt5
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" install
}
