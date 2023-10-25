# Maintainer: éclairevoyant
# Contributor: Anthony Wang <ta180m at pm dot me>
# Contributor: Chris Lane <aur at chrislane dot com>

_pkgname=digikam
pkgname="$_pkgname-git"
pkgver=8.1.0.r673.41241c0e82
pkgrel=1
epoch=1
pkgdesc='An advanced digital photo management application'
arch=('i686' 'x86_64')
license=('GPL')
url='https://www.digikam.org/'
depends=(
	akonadi-contacts
	exiv2
	glu
	imagemagick
	jasper
	kcalendarcore5
	kfilemetadata5
	kio5
	knotifyconfig5
	lensfun
	libass
	libgphoto2
	libksane
	marble-common
	opencv
	perl-image-exiftool
	qt5-networkauth
	qt5-webengine
	qt5-xmlpatterns
	threadweaver5
)
makedepends=(
	boost
	doxygen
	eigen
	extra-cmake-modules
	git
	kdoctools5
)
optdepends=('darktable: RAW import'
            'hugin: panorama tool'
            'perl: for digitaglinktree'
            'qt5-imageformats: TIFF, WEBP support'
            'rawtherapee: RAW import')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://invent.kde.org/graphics/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cmake -B build -S $_pkgname \
		-DBUILD_TESTING=OFF \
		-DENABLE_KFILEMETADATASUPPORT=ON \
		-DENABLE_MEDIAPLAYER=ON \
		-DENABLE_AKONADICONTACTSUPPORT=ON \
		-DENABLE_MYSQLSUPPORT=ON \
		-DENABLE_APPSTYLES=ON \
		-DENABLE_QWEBENGINE=ON
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
