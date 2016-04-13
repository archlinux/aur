# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=skribilo-git
pkgver=v0.9.3_7_g3693635r985
pkgrel=1
pkgdesc="The Ultimate Document Programming Framework from git"
arch=('any')
url="http://www.nongnu.org/skribilo/"
license=('GPL')
depends=('bash')
makedepends=('git' 'guile-reader-git' 'ploticus')
provides=('skribilo')
conflicts=('skribilo')
install=skribilo.install
source=("git://git.sv.gnu.org/skribilo.git")
_gitname="${pkgname%-git}"
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "%sr%s" $(git describe --tags|tr - _) $(git rev-list --count HEAD)
}
pkgver() {
  cd "$_gitname"
  printf "%sr%s" $(git describe --tags|tr - _) $(git rev-list --count HEAD)
}

build() {
  cd "$srcdir"/"$_gitname"

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  rm $pkgdir/usr/share/info/*.png
  install -d $pkgdir/usr/share/doc/$pkgname
  find $srcdir/ -name "*.png" -exec install -m644 {} $pkgdir/usr/share/doc/$pkgname \;
}
