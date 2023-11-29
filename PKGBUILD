# Maintainer:Antonio Rojas <arojas@archlinux.org>

pkgname=kgamma
pkgver=5.90.0
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Adjust your monitor gamma settings'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(gcc-libs
         glibc
         kcmutils
         kconfig
         kcoreaddons
         ki18n
         libx11
         libxxf86vm
         qt6-base)
makedepends=(extra-cmake-modules
             kdoctools)
conflicts=(kgamma5)
replaces=(kgamma5)
groups=(plasma)
source=(https://download.kde.org/unstable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('38a5e559392d6f5357f32415416bfcc03b9e54e1c6054b948fc92f7f5647a939'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
