# Maintainer: éclairevoyant
# Contributor: Anthony Wang <ta180m at pm dot me>
# Contributor: Chris Lane <aur at chrislane dot com>

_pkgname=digikam
pkgname="$_pkgname-git"
pkgver=7.5.0.r4063.gdcef37cf0d
pkgrel=1
pkgdesc='An advanced digital photo management application'
arch=('i686' 'x86_64')
license=('GPL')
url='https://www.digikam.org/'
depends=('akonadi-contacts' 'exiv' 'glu' 'imagemagick' 'jasper' 'kcalendarcore'
         'kfilemetadata' 'kio' 'knotifyconfig' 'lensfun' 'libass' 'libgphoto2'
         'libksane' 'marble-common' 'opencv' 'perl-image-exiftool'
         'qt5-networkauth' 'qt5-webengine' 'qt5-xmlpatterns' 'qtav'
         'threadweaver')
makedepends=('boost' 'doxygen' 'eigen' 'extra-cmake-modules' 'git' 'kdoctools')
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
	cd $_pkgname
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
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
