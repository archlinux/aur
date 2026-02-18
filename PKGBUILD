# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=openjazz
pkgver=20260218
pkgrel=1
pkgdesc="A free, open-source version of the classic Jazz Jackrabbit™ games"
arch=('i686' 'x86_64')
url="http://alister.eu/jazz/oj/"
license=('GPL-2.0-or-later')
makedepends=('cmake' 'ninja')
depends=('sdl2')
install=openjazz.install
source=("https://github.com/AlisterT/openjazz/releases/download/$pkgver/openjazz-$pkgver.tar.gz")
sha256sums=('8f52ea00eff71ed69576e4a63395d8a1d0c4f936aeb36b7c3503f6968edddf1a')

prepare() {
  rm -rf aurbuild
}

build() {
  cmake -S $pkgname-$pkgver -B aurbuild -G Ninja \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DDATAPATH="/usr/share/openjazz/" -DSDL_VERSION=2
  cmake --build aurbuild
}

package() {
  DESTDIR="$pkgdir/" cmake --install aurbuild
}
