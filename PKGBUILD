# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=digikam
pkgname=digikam-without-akonadi-mediawiki-vkontakte
_pkgver=7.2.0
pkgver=${_pkgver//-/_} # for beta versions
pkgrel=1
pkgdesc="An advanced digital photo management application"
arch=(x86_64)
license=(GPL)
url="https://www.digikam.org/"
depends=(lensfun opencv knotifyconfig libksane kfilemetadata qtav marble-common threadweaver kcalendarcore qt5-xmlpatterns imagemagick glu)
makedepends=(extra-cmake-modules doxygen eigen boost kdoctools)
conflicts=('digikam' 'digikam-git')
provides=('digikam')
optdepends=('hugin: panorama tool' 'qt5-imageformats: support for additional image formats (WEBP, TIFF)' 'rawtherapee: RAW import' 'darktable: RAW import' 'perl: for digitaglinktree')
source=(https://download.kde.org/stable/$_pkgname/$_pkgver/$_pkgname-$_pkgver.tar.xz{,.sig}
        digikam-fix-build.patch::https://invent.kde.org/graphics/digikam/-/commit/b428a1fa.patch)
sha256sums=('cd87ece143aefa02e692a4af5c3c3cc107b9a4d61804d79fa77dd2e344798a17'
            'SKIP'
            'f2e951275896c9cb3195e5557482b675bdb5538a12caa6fdf57e309aa77596c1')
validpgpkeys=(D1CF2444A7858C5F2FB095B74A77747BC2386E50) # digiKam.org (digiKam project) <digikamdeveloper@gmail.com>

prepare() {
  patch -d $_pkgname-$_pkgver -p1 < digikam-fix-build.patch # Fix build with Qt post 5.15.2
}

build() {
 cd $srcdir/$_pkgname-$_pkgver
 cmake -DDIGIKAMSC_COMPILE_KIPIPLUGINS=OFF -DBUILD_TESTING=OFF -DENABLE_KFILEMETADATASUPPORT=OFF -DENABLE_MEDIAPLAYER=OFF -DENABLE_AKONADICONTACTSUPPORT=OFF -DENABLE_MYSQLSUPPORT=ON -DENABLE_APPSTYLES=ON -DENABLE_QWEBENGINE=ON
 make
}

package() {
 cd $srcdir/$_pkgname-$_pkgver
 make DESTDIR="$pkgdir" install
}
