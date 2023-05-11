# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kopete
pkgver=23.04.1
pkgrel=1
pkgdesc='Instant Messenger'
url='https://apps.kde.org/kopete/'
arch=(x86_64)
license=(GPL LGPL FDL)
groups=(kde-applications kde-network)
depends=(knotifyconfig kcmutils ktexteditor kcontacts kidentitymanagement libkleo qca-qt5 kdelibs4support khtml
         libidn libotr)
makedepends=(extra-cmake-modules libgadu jsoncpp kdoctools kdesignerplugin kdnssd kinit)
optdepends=('libgadu: Gadu-Gadu protocol' 'kdnssd: bonjour protocol')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('b93d50cf2c2aa6763392af4031cf5e4ee3027c64bafa0f75997abe0dacf0e6ec'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
