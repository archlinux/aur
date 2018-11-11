# Maintainer: Flaviu Tamas <me@flaviutamas.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=polkit-qt4
pkgver=0.112.0+git20180107
pkgrel=1
pkgdesc='A library that allows developers to access PolicyKit API with a nice Qt-style API'
arch=(x86_64 i686)
url='https://www.kde.org/'
license=(LGPL)
depends=(polkit qt4)
makedepends=(cmake polkit qt4 git)
#source=("http://download.kde.org/stable/apps/KDE4.x/admin/${pkgbase}-1-${pkgver}.tar.bz2")
source=("$pkgname"::"git+https://anongit.kde.org/polkit-qt-1.git#commit=cbecf60ac7b5c17cf37503d6675bf5542efbab29")
sha256sums=('SKIP')

build() {
  mkdir -p "$pkgname/build"
  cd "$pkgname/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_DESTINATION=/usr/lib \
    -DUSE_QT4=ON
  make
}

package() {
  cd "$pkgname/build"
  make DESTDIR="$pkgdir" install
}
