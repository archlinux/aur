# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=gitmaster
pkgver=0.8.0
pkgrel=1
pkgdesc="GUI git client written in Qt."
arch=('x86_64' 'i686')
url="https://github.com/bokic/gitmaster"
license=('LGPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'libgit2' 'hicolor-icon-theme' 'glibc' 'libgcc')
makedepends=('cmake' 'ninja')
options=(!debug strip)

source=($pkgname-$pkgver.tar.gz::"https://github.com/bokic/gitmaster/archive/${pkgver}.tar.gz")
sha512sums=("2e238e3846ad2068cf525666e01455a7044da8a68eb24d32f3e385c921ae7ff3b86aaa0f7e320b8c466a5a7e57ea8f5e19aa474570ae980dd4ba83d78e45f26d")

build() {
  cmake -G Ninja -S "${srcdir}/${pkgname}-${pkgver}" -B "build" -DGITMASTER_VERSION_TAG="${pkgver}"
  ninja -C "build"
}

package() {
  DESTDIR="${pkgdir}" ninja -C "build" install
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/gitmaster.desktop" "$pkgdir/usr/share/applications/gitmaster.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/gitmaster.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/gitmaster.svg"
}
