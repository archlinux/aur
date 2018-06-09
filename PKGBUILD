# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
_pkgname=slinp
pkgname=$_pkgname-git
pkgver=17.04.3.g7c94d4a
pkgrel=1
pkgdesc="PDF presentation tool chest"
arch=('i686' 'x86_64')
url='https://uninformativ.de/git/slinp'
license=('MIT')
depends=('gtk3' 'python' 'poppler-glib')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://uninformativ.de/git/slinp.git)
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
