# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=gitmaster
pkgver=0.8.1
pkgrel=1
pkgdesc="GUI git client written in Qt."
arch=('x86_64' 'i686')
url="https://github.com/bokic/gitmaster"
license=('LGPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'libgit2' 'hicolor-icon-theme' 'libstdc++' 'glibc' 'libgcc')
makedepends=('cmake' 'ninja')
options=(!debug strip)

source=($pkgname-$pkgver.tar.gz::"https://github.com/bokic/gitmaster/archive/${pkgver}.tar.gz")
sha512sums=("4d312672e1bbdfdc26a79a81e6b84be16bc6517b9bcafd42c708a00370e08f789181c9cbe1874a1db5aa074a258fc4365ac11caa5428af7a8680df3872591333")

build() {
  cmake -G Ninja -S "${srcdir}/${pkgname}-${pkgver}" -B "build" -DGITMASTER_VERSION_TAG="${pkgver}"
  ninja -C "build"
}

package() {
  DESTDIR="${pkgdir}" ninja -C "build" install
}
