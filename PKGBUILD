# Maintainer: Chris Lane <aur at chrislane dot com>
pkgname=digikam-git
pkgver=v7.2.0.beta1.r500.g9541292038
pkgrel=1
pkgdesc='An advanced digital photo management application'
arch=('i686' 'x86_64')
license=('GPL')
url="https://www.digikam.org/"
depends=(lensfun opencv akonadi-contacts knotifyconfig libksane kfilemetadata qtav marble-common
         threadweaver kcalendarcore qt5-xmlpatterns imagemagick glu)
makedepends=(extra-cmake-modules doxygen eigen boost kdoctools jasper git)
optdepends=('hugin: panorama tool'
            'qt5-imageformats: support for additional image formats (WEBP, TIFF)'
            'jasper: openJPEG support'
            'rawtherapee: RAW import'
            'darktable: RAW import'
            "digikam-plugin-gmic: G'MIC plugin"
            'perl: for digitaglinktree')
conflicts=('digikam')
provides=('digikam')
source=('git+https://invent.kde.org/graphics/digikam.git')
md5sums=('SKIP')

pkgver() {
  cd digikam
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake                               \
    -B build                          \
    -S digikam                        \
    -DCMAKE_BUILD_TYPE=None           \
    -DCMAKE_INSTALL_PREFIX=/usr       \
    -DCMAKE_INSTALL_LIBDIR=lib        \
    -DBUILD_TESTING=OFF               \
    -DENABLE_KFILEMETADATASUPPORT=ON  \
    -DENABLE_MEDIAPLAYER=ON           \
    -DENABLE_AKONADICONTACTSUPPORT=ON \
    -DENABLE_MYSQLSUPPORT=ON          \
    -DENABLE_APPSTYLES=ON             \
    -DENABLE_QWEBENGINE=ON            \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" install -C build
}

# vim:set ts=2 sw=2 et:
