# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=skribilo-git
pkgver=v0.9.3_9_gc3d1019r987
pkgrel=2
pkgdesc="The Ultimate Document Programming Framework from git"
arch=('any')
url="http://www.nongnu.org/skribilo/"
license=('GPL')
depends=('bash')
makedepends=('git' 'guile-reader' 'ploticus')
provides=('skribilo')
conflicts=('skribilo')
source=("git://git.sv.gnu.org/skribilo.git")
md5sums=('SKIP')
options=("!makeflags")

pkgver() {
  cd "${pkgname%-git}"
  printf "%sr%s" $(git describe --tags|tr - _) $(git rev-list --count HEAD)
}

build() {
  cd "${pkgname%-git}"
  autoconf
  GUILE_EFFECTIVE_VERSION=2.0 GUILE=/usr/bin/guile2.0 ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
  rm $pkgdir/usr/share/info/*.png
  install -d $pkgdir/usr/share/doc/$pkgname
  find $srcdir/ -name "*.png" -exec install -m644 {} $pkgdir/usr/share/doc/$pkgname \;
}
