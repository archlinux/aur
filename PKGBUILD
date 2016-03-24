# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethereum-serpent
pkgver=2.0.2
pkgrel=1
pkgdesc="Serpent compiler"
arch=('i686' 'x86_64')
groups=('ethereum')
url="https://github.com/ethereum/serpent"
license=('WTFPL')
depends=('python2')
provides=('ethereum-serpent' 'serpent')
conflicts=('ethereum' 'ethereum-serpent' 'serpent')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/e/ethereum-serpent/${pkgname}-${pkgver}.tar.gz
    01_makefile.patch)
sha256sums=('523bf8664b9c929536df49e9bc751c756114444904be8e3dc35f8972812cd4ea'
            '7caf994a8759d8d92137a5159981330436cb54c27a943b45eaa8c505238adc3b')


prepare() {
  cd "${pkgname}-${pkgver}"

  patch -Np1 -i ${srcdir}/01_makefile.patch

  #msg2 'Fixing Python version...'
  #find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  #find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "$pkgname-${pkgver}"

  make
}

package() {
  cd "$pkgname-${pkgver}"

  #msg2 'Installing documentation...'
  #install -dm 755 "$pkgdir/usr/share/doc/$pkgname"
  #cp -dpr --no-preserve=ownership examples "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/"{bin,lib}
  make DESTDIR=$pkgdir install

  #msg2 'Cleaning up pkgdir...'
  #find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  #find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
