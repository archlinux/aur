# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=gitmaster
pkgver=0.1.4
pkgrel=1
pkgdesc="GUI git client written in Qt."
arch=('x86_64' 'i686')
url="https://github.com/bokic/gitmaster"
license=('LGPL3')
depends=('qt6-base' 'libgit2')
makedepends=('cmake' 'ninja')

source=($pkgname-$pkgver.tar.gz::"https://github.com/bokic/gitmaster/archive/${pkgver}.tar.gz")
sha256sums=("057ece74ed08e609304e014498a8fa2f0aec392c3226cd5afc05ad89ad232ddd")

build() {
  cmake -G Ninja -S "${srcdir}/${pkgname}-${pkgver}" -B "build"
  ninja -C "build"
}

package() {
  DESTDIR="${pkgdir}" ninja -C "build" install
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/gitmaster.desktop" "$pkgdir/usr/share/applications/gitmaster.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/gitmaster.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/gitmaster.svg"
}
