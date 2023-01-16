# Maintainer: éclairevoyant
# Contributor: Kaizhao Zhang <zhangkaizhao at gmail dot com>

_pkgname=quiterss2
pkgname="$_pkgname-git"
pkgver=r199.4b3434f
pkgrel=1
epoch=1
pkgdesc="Cross-platform news feed reader written in Qt/C++/QML"
arch=('x86_64')
url="https://github.com/QuiteRSS/quiterss2"
license=('GPL3')
depends=('qt5-webengine')
makedepends=('git' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_pkgname
	qmake-qt5 CONFIG+=release PREFIX=/usr quiterss2.pro
	make
}

package() {
	cd $_pkgname
	make INSTALL_ROOT="$pkgdir/" install
}
