# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=gitmaster
pkgver=0.9.3
pkgrel=1
pkgdesc="GUI git client written in Qt."
arch=('x86_64' 'i686')
url="https://github.com/bokic/gitmaster"
license=('LGPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'libgit2' 'zlib' 'hicolor-icon-theme' 'libstdc++' 'glibc' 'libgcc')
makedepends=('cmake' 'ninja')
options=(!debug strip)

source=($pkgname-$pkgver.tar.gz::"https://github.com/bokic/gitmaster/archive/${pkgver}.tar.gz")
sha512sums=("e4f4f88576e5351453af333e6433fc0bb39170f456e4f45ddf66aaebf0af7787edf2fc80a2addaa52ac1de6b39ac97ecbc14555819c6e05df246877bd994476c")

build() {
  cmake -G Ninja -S "${srcdir}/${pkgname}-${pkgver}" -B "build" -DCMAKE_BUILD_TYPE=Release -DGITMASTER_VERSION_TAG="${pkgver}"
  cmake --build "build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build"
}
