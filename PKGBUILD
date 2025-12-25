# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=gitmaster
pkgver=0.3
pkgrel=1
pkgdesc="GUI git client written in Qt."
arch=('x86_64' 'i686')
url="https://github.com/bokic/gitmaster"
license=('LGPL-3.0-only')
depends=('qt6-base' 'libgit2' 'hicolor-icon-theme' 'gcc-libs' 'glibc')
makedepends=('cmake' 'ninja')

source=($pkgname-$pkgver.tar.gz::"https://github.com/bokic/gitmaster/archive/${pkgver}.tar.gz")
sha256sums=("36d2081a6ba5559e64185e407bc208906d208007308bd60e4db9747c56995fd1")

build() {
  cmake -G Ninja -S "${srcdir}/${pkgname}-${pkgver}" -B "build"
  ninja -C "build"
}

package() {
  DESTDIR="${pkgdir}" ninja -C "build" install
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/gitmaster.desktop" "$pkgdir/usr/share/applications/gitmaster.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/gitmaster.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/gitmaster.svg"
}
