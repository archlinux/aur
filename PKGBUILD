# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=gitmaster
pkgver=0.8.2
pkgrel=1
pkgdesc="GUI git client written in Qt."
arch=('x86_64' 'i686')
url="https://github.com/bokic/gitmaster"
license=('LGPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'libgit2' 'hicolor-icon-theme' 'libstdc++' 'glibc' 'libgcc')
makedepends=('cmake' 'ninja')
options=(!debug strip)

source=($pkgname-$pkgver.tar.gz::"https://github.com/bokic/gitmaster/archive/${pkgver}.tar.gz")
sha512sums=("9ba999e671c651a2d802e6645ada0ee6ac1f3faf159f4c95746ad2b2518e7e41ed1bd473887ea2cbf0d542771b07b1076cff5a40446fd166d3d48679ee7e93ba")

build() {
  cmake -G Ninja -S "${srcdir}/${pkgname}-${pkgver}" -B "build" -DCMAKE_BUILD_TYPE=Release -DGITMASTER_VERSION_TAG="${pkgver}"
  cmake --build "build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build"
}
