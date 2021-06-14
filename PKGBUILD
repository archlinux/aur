# Contributor: Max Resch <resch.max@gmail.com>
# Contributor: Ivan Shapovalov <intelfx100@gmail.com>
#
# COPIED FROM AUR3
#


pkgname=kcm-polkit-kde-git
epoch=1
pkgver=215.4aca751
pkgrel=1
pkgdesc="Configuration for Policy Kit"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/extragear/base/polkit-kde-kcmodules-1"
license=('GPL')
makedepends=('kcmutils-git')
provides=('polkit-kde-kcmodules' 'kcm-polkit-kde')
conflicts=('polkit-kde-kcmodules')
makedepends=('cmake' 'kcmutils-git' 'git')

source=("git+https://anongit.kde.org/polkit-kde-kcmodules-1")
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
		-DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt5
	make
}

package() {
	cd polkit-kde-kcmodules-1

	make DESTDIR="${pkgdir}" install
}
