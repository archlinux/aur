# $Id: PKGBUILD 320127 2018-03-24 09:48:28Z arojas $
# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
_pkgver=6.2.0
pkgver=${_pkgver//-/_} # for beta versions
pkgrel=1
pkgdesc="An advanced digital photo management application"
arch=(x86_64)
license=(GPL)
url="https://www.digikam.org/"
depends=(lensfun opencv akonadi-contacts knotifyconfig libksane kfilemetadata qtav marble-common threadweaver kcalcore
         qt5-xmlpatterns imagemagick)
makedepends=(extra-cmake-modules doxygen eigen boost kdoctools libkvkontakte)
optdepends=('hugin: panorama tool' 'qt5-imageformats: support for additional image formats (WEBP, TIFF)'
            'libkvkontakte: VKontakte plugin')
source=("https://download.kde.org/stable/$pkgname/$_pkgver/$pkgname-$_pkgver.tar.xz"{,.sig})
sha256sums=('28762ea0f03a82e3b2473c0682a358c9b83f5013aec827dd5ab6556a1f29baeb'
            'SKIP')
validpgpkeys=(D1CF2444A7858C5F2FB095B74A77747BC2386E50) # digiKam.org (digiKam project) <digikamdeveloper@gmail.com>

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake ../$pkgname-$_pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF \
    -DENABLE_KFILEMETADATASUPPORT=ON \
    -DENABLE_MEDIAPLAYER=ON \
    -DENABLE_AKONADICONTACTSUPPORT=ON \
    -DENABLE_MYSQLSUPPORT=ON \
    -DENABLE_APPSTYLES=ON \
    -DENABLE_QWEBENGINE=ON \
    -DOpenGL_GL_PREFERENCE=GLVND
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
