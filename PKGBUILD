# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: birdflesh <antkoul at gmail dot com>

pkgname=kcm-about-distro-kde4
_pkgname=about-distro
pkgver=1.1.0
pkgrel=1
pkgdesc="KCM displaying distribution and system information for KDE4"
arch=('i686' 'x86_64')
url='https://projects.kde.org/about-distro'
license=('GPL3')
depends=('kdelibs' 'kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=("http://download.kde.org/stable/$_pkgname/$pkgver/src/$_pkgname-$pkgver.tar.xz"
        "kcm-about-distrorc"
        "arch-logo.png")
md5sums=('99694c8c85947d983b20f21e21fd184c'
         'f2cd5b00b092866b71dacb434cdb14f1'
         '3a0eaa26e5fb5fd14dd261e785091c19')

build() {
  cd "$srcdir"
  mkdir build
  cd build
  cmake ../$_pkgname-$pkgver \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/kcm-about-distrorc" "$pkgdir/usr/share/config/kcm-about-distrorc"
  install -Dm644 "$srcdir/arch-logo.png" "$pkgdir/usr/share/apps/$_pkgname/arch-logo.png"
}
