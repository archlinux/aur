# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=ksysguard
pkgver=5.18.1
pkgrel=1
pkgdesc='Track and control the processes running in your system'
arch=(x86_64)
url='https://userbase.kde.org/KSysGuard'
license=(LGPL)
depends=(knewstuff libksysguard kinit)
makedepends=(extra-cmake-modules kdoctools)
optdepends=('nvidia-utils: NVIDIA GPU usage')
groups=(plasma)
install=$pkgname.install
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('d88c8c324fd5835d6287107b162b2434f43dcd3adb01bb9b2a9c4b93afb0ece2'
            'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
