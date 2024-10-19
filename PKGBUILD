# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdelibs4support
pkgver=5.116.0
pkgrel=2
pkgdesc='Porting aid from KDELibs4'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kunitconversion5 kitemmodels5 kemoticons kparts5 perl)
makedepends=(extra-cmake-modules kdoctools5 qt5-tools networkmanager perl-uri kdesignerplugin)
groups=(kf5-aids)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/portingAids/$pkgname-$pkgver.tar.xz)
sha256sums=('ed915dd146eb10262816da62904d04f78dacf9595d44d400dd1644d21c10c1e4')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

# cert bundle seems to be hardcoded
# link it to the one from ca-certificates
  rm -f "$pkgdir"/usr/share/kf5/kssl/ca-bundle.crt
  ln -sf /etc/ssl/certs/ca-certificates.crt "$pkgdir"/usr/share/kf5/kssl/ca-bundle.crt
}
