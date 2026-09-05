# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=gitmaster
pkgver=0.9.0
pkgrel=1
pkgdesc="GUI git client written in Qt."
arch=('x86_64' 'i686')
url="https://github.com/bokic/gitmaster"
license=('LGPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'libgit2' 'zlib' 'hicolor-icon-theme' 'libstdc++' 'glibc' 'libgcc')
makedepends=('cmake' 'ninja')
options=(!debug strip)

source=($pkgname-$pkgver.tar.gz::"https://github.com/bokic/gitmaster/archive/${pkgver}.tar.gz")
sha512sums=("562062e389b2f0189d24aeb3f079444211635b76eeeaf96abeef597fa380accbee7d018b2f6d080f5443bf45fa4645e68c3a751ddc3f5460d60fae7e6026a5e9")

build() {
  cmake -G Ninja -S "${srcdir}/${pkgname}-${pkgver}" -B "build" -DCMAKE_BUILD_TYPE=Release -DGITMASTER_VERSION_TAG="${pkgver}"
  cmake --build "build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build"
}
