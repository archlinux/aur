# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: rennero <rennero@bastardi.net>

pkgname=hasciicam
pkgver=1.3
pkgrel=4
pkgdesc="Renders video input as ascii (to the terminal, textfile, or live webpage)"
url="http://ascii.dyne.org/"
depends=('aalib' 'libv4l')
arch=('i686' 'x86_64')
source=("https://files.dyne.org/${pkgname}?file=/${pkgname}/${pkgname}_$pkgver.tar.gz"{,.asc}
        'const_fix.patch')
md5sums=('4d77c6a4cf6e2b1474d5fec0ff450b80'
         'SKIP'
         'ae7feb261aa02ec0c1a38423559cba04')
validpgpkeys=('6113D89CA825C5CEDD02C87273B35DA54ACB7D10') # Denis Roio (Jaromil) <jaromil@dyne.org>
license=('GPL-3.0-only')

prepare() {
  cd ${pkgname}_$pkgver
  patch -Np1 -i "${srcdir}/const_fix.patch"
}

build() {
  cd ${pkgname}_$pkgver
  ./configure --prefix="$pkgdir/usr" --mandir="$pkgdir/usr/share/man"
  make
}

package() {
  cd ${pkgname}_$pkgver
  make install

  cd "$pkgdir/usr/share"
  mv icons pixmaps
  rm -r menu
}
