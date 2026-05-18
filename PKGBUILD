# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=hoichess
_pkgname=hoichess-debian
pkgver=0.22.0
_pkgver=0.22.0-3
pkgrel=3
pkgdesc="Xboard compatible chess engine and xiangqi (Chinese chess) engine"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL-2.0-or-later')
url="http://www.hoicher.de/hoichess"
depends=('glibc' 'libgcc' 'libstdc++' 'readline')
makedepends=('bash' 'gcc' 'm4' 'perl')
source=("https://salsa.debian.org/debian/hoichess/-/archive/debian/0.22.0-3/hoichess-debian-0.22.0-3.tar.gz")
sha256sums=('ee7eeed3b3d0d02ca442918939353455df9e038958bcb21eab699c6c521742ec')

prepare() {
  cd "$srcdir/${_pkgname}-${_pkgver}"
  sed -i 's/games$/bin/' Makefile
  sed -i 's/CXXFLAGS\ =/CXXFLAGS\ +=/' src/Makefile
  cd "book"
  sh "download-gnuchess-book"
}

build() {
  cd "$srcdir/${_pkgname}-${_pkgver}"
  make
}

package() {
  cd "$srcdir/${_pkgname}-${_pkgver}"
  make DESTDIR="$pkgdir" install
}
