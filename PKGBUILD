# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=liblcf
pkgver=0.8.1
pkgrel=1
pkgdesc="Library to handle RPG Maker 2000/2003 and EasyRPG projects"
arch=('x86_64')
url="https://easyrpg.org"
license=('MIT')
provides=('lcf2xml' 'lcfstrings')
depends=('gcc-libs' 'expat' 'icu' 'libinih')
makedepends=('cmake' 'ninja')
source=("https://easyrpg.org/downloads/player/$pkgver/liblcf-$pkgver.tar.xz")
sha256sums=('e827b265702cf7d9f4af24b8c10df2c608ac70754ef7468e34836201ff172273')

prepare() {
  rm -rf aurbuild
}

build() {
  cmake -S liblcf-$pkgver -B aurbuild -G Ninja \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBLCF_UPDATE_MIMEDB=OFF
  cmake --build aurbuild
}

check() {
  cmake --build aurbuild --target check
}

package() {
  DESTDIR="$pkgdir" cmake --install aurbuild
  # license
  install -Dm644 liblcf-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
