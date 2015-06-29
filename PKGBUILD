# Contributor: 458italia <svenskaparadox@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=nwcc
pkgver=0.8.3
pkgrel=1
epoch=
pkgdesc="A small C compiler for Unix systems."
arch=('i686' 'x86_64')
url="http://nwcc.sourceforge.net/"
license=('BSD')
groups=()
depends=('glibc')
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://downloads.sourceforge.net/$pkgname/${pkgname}_${pkgver}.tar.gz")
noextract=()
options=()
md5sums=('39511d2cb182925273a4493195236eae')
sha1sums=('2ab1825dc1f8bd5258204bab19e8fafad93fef26')
sha256sums=('e64b16c663f2f845d6436342722d29a5e32d03602971de2d521281a18188b065')

prepare() {
  cd ${pkgname}_${pkgver}
  sed 's|lib64/|lib/|g' -i driver.c
  sed 's|-Wall -W -ggdb -g||g' -i configure
}

build() {
  cd ${pkgname}_${pkgver}
  ./configure --installprefix=/usr --nocross
  make
}

package() {
  cd ${pkgname}_${pkgver}
  mkdir -p "$pkgdir"/usr/{bin,lib}
  install -m755 nwcc{,1} snake "$pkgdir"/usr/bin/
  install -m644 libnwcc.o "$pkgdir"/usr/lib/
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

