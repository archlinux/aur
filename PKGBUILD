# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=gitmaster
pkgver=0.9.2
pkgrel=1
pkgdesc="GUI git client written in Qt."
arch=('x86_64' 'i686')
url="https://github.com/bokic/gitmaster"
license=('LGPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'libgit2' 'zlib' 'hicolor-icon-theme' 'libstdc++' 'glibc' 'libgcc')
makedepends=('cmake' 'ninja')
options=(!debug strip)

source=($pkgname-$pkgver.tar.gz::"https://github.com/bokic/gitmaster/archive/${pkgver}.tar.gz")
sha512sums=("55fe0166e5ef9ed43754ea83afa7a5f76f2997cdc6efdab0b6135c76932b6595df0210fe67c4a2df0b49422254ef88ed57e48b537df256f51388426b6ed57a77")

build() {
  cmake -G Ninja -S "${srcdir}/${pkgname}-${pkgver}" -B "build" -DCMAKE_BUILD_TYPE=Release -DGITMASTER_VERSION_TAG="${pkgver}"
  cmake --build "build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build"
}
