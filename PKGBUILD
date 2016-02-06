# Contributor: Max Resch <resch.max@gmail.com>
# Contributor: Ivan Shapovalov <intelfx100@gmail.com>
#
# COPIED FROM AUR3
#


pkgname=kcm-polkit-kde-git
epoch=1
pkgver=160.9ad726f
pkgrel=1
pkgdesc="Configuration for Policy Kit"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/extragear/base/polkit-kde-kcmodules-1"
license=('GPL')
depends=('polkit-kde')
provides=('polkit-kde-kcmodules')
conflicts=('polkit-kde-kcmodules')
makedepends=('cmake' 'automoc4' 'git')

source=("git://anongit.kde.org/polkit-kde-kcmodules-1")
md5sums=('SKIP')

pkgver() {
	cd polkit-kde-kcmodules-1

	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd polkit-kde-kcmodules-1

	cmake . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
	make
}

package() {
	cd polkit-kde-kcmodules-1

	make DESTDIR="${pkgdir}" install
}
