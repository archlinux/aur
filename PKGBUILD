# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Paul Dino Jones "ZitZ" <Raptorman18@gmail.com>

pkgname=openjazz
pkgver=20231028
pkgrel=1
pkgdesc="A free, open-source version of the classic Jazz Jackrabbit™ games"
arch=('i686' 'x86_64')
url="http://alister.eu/jazz/oj/"
license=('GPL')
makedepends=('git' 'cmake' 'ninja')
depends=('sdl2')
install=openjazz.install
source=("https://github.com/AlisterT/openjazz/releases/download/$pkgver/openjazz-$pkgver.tar.xz")
sha256sums=('7240e14d07130c1be9e59b4f336cf9d557cebd97fdb6f1b960f0f4c4e33c256b')

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
