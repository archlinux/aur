# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=openjazz-git
_pkgname=${pkgname%-*}
pkgver=20190106.r119.gea87681
pkgrel=1
pkgdesc="A free, open-source version of the classic Jazz Jackrabbit™ games (development version)"
arch=('i686' 'x86_64')
url="http://alister.eu/jazz/oj/"
license=('GPL')
conflicts=("$_pkgname")
provides=("$_pkgname")
makedepends=('git' 'cmake' 'ninja' 'asciidoctor')
depends=('sdl2')
install=$_pkgname.install
source=($_pkgname::"git+https://github.com/AlisterT/openjazz.git")
sha256sums=('SKIP')

pkgver() {
  git -C $_pkgname describe --long | sed 's/-/.r/;s/-/./'
}

prepare() {
  rm -rf aurbuild
}

build() {
  cmake -S $_pkgname -B aurbuild -G Ninja \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DDATAPATH="/usr/share/openjazz/"
  cmake --build aurbuild
}

package() {
  DESTDIR="$pkgdir/" cmake --install aurbuild
}
