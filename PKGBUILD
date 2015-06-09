# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: noonov <noonov@gmail.com>

pkgname=mfiler4
pkgver=1.3.1
pkgrel=2
pkgdesc="A feature-rich 2-pane console file manager with xyzsh shell script language"
arch=('i686' 'x86_64')
url="https://github.com/ab25cq/mfiler4/"
license=('MIT')
depends=('xyzsh')
optdepends=('lv' 'vim')
source=(http://dl.sourceforge.jp/mfiler4/60172/${pkgname}-${pkgver}.tgz
Makefile.in.patch)
md5sums=('8ff3d964dfd26af47b8fcb7c6cb5022e'
         'c9e8894ea4361b95fef45f6536303167')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -i -p1 --verbose Makefile.in $srcdir/Makefile.in.patch
  ./configure --prefix=/usr --sysconfdir=/etc --with-optimize
  make -j1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make -j1 DESTDIR=${pkgdir} install
  install --mode=644 -D --no-target-directory $srcdir/$pkgname-$pkgver/LICENSE "$pkgdir"/usr/share/$pkgname/LICENSE
}

