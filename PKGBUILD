# Maintainer: Gunnar Bretthauer <taijian@posteo.de>
# Contributor: AudioLinux  <audiolinux AT fastmail DOT fm>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=digikam
pkgname=digikam-without-akonadi-mediawiki-vkontakte
_pkgver=8.1.0
pkgver=${_pkgver//-/} # for beta versions
pkgrel=1
pkgdesc='An advanced digital photo management application - without akonadi & mariadb'
arch=(x86_64)
license=(GPL)
url='https://www.digikam.org/'
depends=(lensfun opencv knotifyconfig libksane kfilemetadata marble-common threadweaver kcalendarcore
         qt5-networkauth qt5-xmlpatterns imagemagick jasper glu perl-image-exiftool)
makedepends=(extra-cmake-modules doxygen eigen boost kdoctools)
conflicts=('digikam' 'digikam-git')
provides=('digikam')
optdepends=('hugin: panorama tool'
            'qt5-imageformats: support for additional image formats (WEBP, TIFF)'
            'rawtherapee: RAW import'
            'darktable: RAW import'
            'perl: for digitaglinktree')
source=(https://download.kde.org/stable/$_pkgname/${_pkgver%-*}/digiKam-$_pkgver.tar.xz{,.sig})
sha256sums=('0503c034e445ff424f18a6715c0a7a79be4a5e0c82b3ebc461a21cec3745a5b3'
            'SKIP')
validpgpkeys=(D1CF2444A7858C5F2FB095B74A77747BC2386E50) # digiKam.org (digiKam project) <digikamdeveloper@gmail.com>

build() {
  cmake -B build -S $_pkgname-$_pkgver \
    -DBUILD_TESTING=OFF \
    -DENABLE_KFILEMETADATASUPPORT=ON \
    -DENABLE_MEDIAPLAYER=ON \
    -DENABLE_AKONADICONTACTSUPPORT=OFF \
    -DENABLE_MYSQLSUPPORT=ON \
    -DENABLE_APPSTYLES=ON \
    -DENABLE_QWEBENGINE=ON \
    -DSSE4_1_FOUND=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

