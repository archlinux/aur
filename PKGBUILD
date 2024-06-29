# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: noonov <noonov@gmail.com>

pkgname=xyzsh
pkgver=1.5.8
pkgrel=5
pkgdesc="Interactive shell and text processing tools"
arch=('i686' 'x86_64')
url="https://github.com/ab25cq/xyzsh"
license=('MIT')
depends=('glibc' 'ncurses' 'oniguruma')
source=(https://osdn.net/projects/${pkgname}/downloads/60140/${pkgname}-${pkgver}.tgz gcc14.patch)
md5sums=('4fab43dbd794fb4af871ac6c9989526b'
	 '084be8ed51601d02c72218d8f9034927')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  # https://github.com/ab25cq/xyzsh/issues/5
  patch -p1 -i ../gcc14.patch
  ./configure --prefix=/usr --sysconfdir=/etc --with-optimize
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
  install --mode=644 -D --no-target-directory $srcdir/$pkgname-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

}
