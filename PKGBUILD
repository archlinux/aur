# Maintainer: Popolon <popolon@popolon.org>

pkgname=mathmod
pkgver=12.0
pkgrel=1
pkgdesc="modelisation and manipulation of mathematics objects"
arch=('x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64' 'loong64' 'powerpc' 'powerpc64le' 'powerpc64')
url="https://github.com/parisolab/mathmod/"
license=('GPLv2')
depends=('qt5-base')
source=(https://github.com/parisolab/${pkgname}/archive/${pkgver}.tar.gz
        MathMod.desktop)
sha256sums=('5758423f87ec71da9afe86e250127f62d74d44a6a3131b6da99c9d830eafb300'
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
