# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=jgnash
pkgver=2.31.0
pkgrel=1
pkgdesc="Cross platform personal finance application written in Java"
arch=('any')
url="http://sourceforge.net/projects/jgnash/"
license=('GPL3')
depends=('java-runtime')
source=(http://sourceforge.net/projects/$pkgname/files/Active%20Stable%202.x/$pkgname-$pkgver-bin.zip)
sha256sums=('3b2c27fb57ea0a0205a2b6cdb1ce0b9214b7bb68f45a8e0148f738260282d9cd')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver
  rm *.exe
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -d "${pkgdir}"/usr/share/java/$pkgname
  cp -r * "${pkgdir}"/usr/share/java/$pkgname

# executable file
  install -d "${pkgdir}"/usr/bin
  echo "#!/bin/bash" > "${pkgdir}"/usr/bin/$pkgname
  echo "java -jar /usr/share/java/jgnash/jgnash2.jar" >> "${pkgdir}"/usr/bin/$pkgname
  chmod +x "${pkgdir}"/usr/bin/$pkgname
}
