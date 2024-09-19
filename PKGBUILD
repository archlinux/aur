# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=openjazz
pkgver=20240919
pkgrel=1
pkgdesc="A free, open-source version of the classic Jazz Jackrabbit™ games"
arch=('i686' 'x86_64')
url="http://alister.eu/jazz/oj/"
license=('GPL-2.0-or-later')
makedepends=('git' 'cmake' 'ninja')
depends=('sdl2')
install=openjazz.install
source=("https://github.com/AlisterT/openjazz/releases/download/$pkgver/openjazz-$pkgver.tar.gz")
sha256sums=('ab02b8838804f3002ec8e86bffcf38a9ea79303cba7c9eafbfb16a9b367c6482')

prepare() {
  rm -rf aurbuild
}

build() {
  cmake -S $pkgname-$pkgver -B aurbuild -G Ninja \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DDATAPATH="/usr/share/openjazz/"
  cmake --build aurbuild
}

package() {
  DESTDIR="$pkgdir/" cmake --install aurbuild
}
