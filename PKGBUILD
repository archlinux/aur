# Contributor: birdflesh <antkoul at gmail dot com>
# Maintainer: SanskritFritz (gmail)
# Maintainer: martin sandsmark <martin.sandsmark@kde.org>

pkgname=mangonel-git
pkgver=r266.d2f8899
pkgrel=1
pkgdesc="Simple but fast application launcher."
arch=('i686' 'x86_64')
url='https://invent.kde.org/utilities/mangonel'
license=('GPL')
depends=('knotifyconfig' 'kunitconversion')
makedepends=('extra-cmake-modules' 'git')
provides=('mangonel')
conflicts=('mangonel')
source=("git+https://invent.kde.org/utilities/mangonel.git")
md5sums=('SKIP')

pkgver() {
	cd mangonel
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../mangonel \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE_INSTALL_LIBDIR=lib \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}

# vim: set noexpandtab filetype=sh:
