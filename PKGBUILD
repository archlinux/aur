# Contributor: derfenix <derfenix@gmail.com>

pkgname=neochat-git
pkgver=r2758.31fed836
pkgrel=1
pkgdesc="A client for matrix, the decentralized communication protocol"
arch=('i686' 'x86_64')
url="https://invent.kde.org/network/neochat"
license=('GPL3')
depends=("qqc2-desktop-style" "kirigami-addons" "libquotient" "kquickimageeditor" "kitemmodels" "kio" "syntax-highlighting" "qtkeychain-qt5" "cmark" "hicolor-icon-theme" "qcoro-qt5")
makedepends=('cmake>=3.1.0' 'git' 'extra-cmake-modules') 
source=("neochat::git+https://invent.kde.org/network/neochat.git")
conflicts=('neochat')
provides=('neochat')
sha256sums=('SKIP')

pkgver() {
	cd "neochat"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd neochat
	cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
	make -j $(nproc) -C build
}

package() {
	cd "${srcdir}/neochat"
	make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
