# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=gitmaster
pkgver=0.1.3
pkgrel=2
pkgdesc="GUI git client written in Qt."
arch=('x86_64' 'i686')
url="https://github.com/bokic/gitmaster"
license=('LGPL3')
depends=('qt6-base' 'libgit2')

source=($pkgname-$pkgver.tar.gz::"https://github.com/bokic/gitmaster/archive/${pkgver}.tar.gz")
sha256sums=("fa190498cd06656fa2e171d2727562573e16d165052aa0ab4c178f9b70df56b7")

build() {
  cmake -G Ninja -S "${srcdir}/${pkgname}-${pkgver}" -B "build"
  ninja -C "build"
}

package() {
  DESTDIR="${pkgdir}" ninja -C "build" install
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/gitmaster.desktop" "$pkgdir/usr/share/applications/gitmaster.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/gitmaster.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/gitmaster.svg"
}
