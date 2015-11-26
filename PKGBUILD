# $Id$
# Maintainer: Bhushan Shah <bshah@kde.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kinit-nooom
pkgver=5.16.0
pkgrel=1
pkgdesc='Process launcher to speed up launching KDE applications (With OOM disabled)'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kinit'
license=('LGPL')
depends=('kio')
provides=('kinit')
conflicts=('kinit')
makedepends=('extra-cmake-modules' 'kdoctools')
groups=('kf5')
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/kinit-${pkgver}.tar.xz"
        "001-disable-oom-protection.patch")
md5sums=('bd45fab53c6584295b607d98f5b2dd83'
         '96dec3370228f0024879bf5cf77c98dd')
prepare() {
  mkdir -p build
  cd kinit-${pkgver}
  patch -p1 -i "$srcdir/001-disable-oom-protection.patch"
}

build() {
  cd build
  cmake ../kinit-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
