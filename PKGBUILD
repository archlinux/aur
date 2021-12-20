# Maintainer: Popolon <popolon@popolon.org>

pkgname=mathmod
pkgver=11.1
pkgrel=1
pkgdesc="modelisation and manipulation of mathematics objects"
arch=('x86_64' 'armv7h' 'armv8' 'riscv32' 'riscv64')
url="https://github.com/parisolab/mathmod/"
license=('GPLv2')
depends=('qt5-base')
source=(https://github.com/parisolab/${pkgname}/archive/${pkgver}.tar.gz
        MathMod.desktop)
sha256sums=('b9d4c550d09a8ad307df90ffbb6f89e81846c5ea93d3f3e2616207a76227421a'
            '6c001dae8ae8c1f6a4aaef7bf2d098a058c1e944dbf01642ea9792926b7204e9')

prepare() {
  cd $pkgname-$pkgver
  qmake
}
build() {
  cd $pkgname-$pkgver
  make
}

package() {

  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm 755 "MathMod" "${pkgdir}/usr/bin/MathMod"
  install -Dm 644 "images/icone32x32.png" "${pkgdir}/usr/share/icons/MathMod.png"
  install -Dm 644 "Licence.txt" "${pkgdir}/usr/share/licenses/${pkgname}/Licence.txt"
  cd -
  install -Dm 644 "MathMod.desktop" "${pkgdir}/usr/share/applications/MathMod.desktop"

}
