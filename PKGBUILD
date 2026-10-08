# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=gitmaster
pkgver=0.9.1
pkgrel=1
pkgdesc="GUI git client written in Qt."
arch=('x86_64' 'i686')
url="https://github.com/bokic/gitmaster"
license=('LGPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'libgit2' 'zlib' 'hicolor-icon-theme' 'libstdc++' 'glibc' 'libgcc')
makedepends=('cmake' 'ninja')
options=(!debug strip)

source=($pkgname-$pkgver.tar.gz::"https://github.com/bokic/gitmaster/archive/${pkgver}.tar.gz")
sha512sums=("75c9abb9be2581c8d6c4b690d0f21c52e7914d97f2ff6194df70b14acb1e290a0fc752c19223bc7de3c4e106d0fbacd0ed412fe85a18adb47a31c9a2ead09b27")

build() {
  cmake -G Ninja -S "${srcdir}/${pkgname}-${pkgver}" -B "build" -DCMAKE_BUILD_TYPE=Release -DGITMASTER_VERSION_TAG="${pkgver}"
  cmake --build "build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build"
}
