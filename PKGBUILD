# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
_pkgname=slinp
pkgname=$_pkgname-git
pkgver=15.03
pkgrel=1
pkgdesc="PDF presentation tool chest"
arch=('i686' 'x86_64')
url='http://www.uninformativ.de/projects/?q=slinp'
license=('custom:PIZZA-WARE')
depends=('gtk3' 'python' 'poppler-glib')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git://github.com/vain/slinp.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g; s|v||'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" prefix="/usr" install

  # This is specific to Arch Linux.
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
