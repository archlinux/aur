# Maintainer: Popolon <popolon@popolon.org>

pkgname=mathmod
pkgver=11.0
pkgrel=1
pkgdesc="modelisation and manipulation of mathematics objects"
arch=('x86_64' 'armv7h' 'armv8')
url="https://github.com/parisolab/mathmod/"
license=('GPLv2')
depends=('qt5-base')
source=(https://github.com/parisolab/${pkgname}/archive/${pkgver}.tar.gz
        MathMod.desktop)
sha256sums=('418e5a40dc0e9e7e41027d9d9f0fe7dc2a27a2df1711891451e7af4a04140dbe'
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
