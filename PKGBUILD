# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=gitmaster
pkgver=0.7.0
pkgrel=1
pkgdesc="GUI git client written in Qt."
arch=('x86_64' 'i686')
url="https://github.com/bokic/gitmaster"
license=('LGPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'libgit2' 'hicolor-icon-theme' 'libstdc++' 'glibc' 'libgcc')
makedepends=('cmake' 'ninja')
options=(!debug strip)

source=($pkgname-$pkgver.tar.gz::"https://github.com/bokic/gitmaster/archive/${pkgver}.tar.gz")
sha512sums=("8bb95831b3140d23fdcb05a3cd263a044e2496497910474dc66f6e51c8f81dd182beb7028be8e67030bac92f5c35b2b43ecdb9adb0ad62a175f23cf85af738b2")

build() {
  cmake -G Ninja -S "${srcdir}/${pkgname}-${pkgver}" -B "build" -DGITMASTER_VERSION_TAG="${pkgver}"
  ninja -C "build"
}

package() {
  DESTDIR="${pkgdir}" ninja -C "build" install
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/gitmaster.desktop" "$pkgdir/usr/share/applications/gitmaster.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/gitmaster.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/gitmaster.svg"
}
