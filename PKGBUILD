# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Loui Chang <louipc [dot.] ist [at@] gmail.com>
# Contributor: aksr <aksr at t-com dot me>

pkgname=jove
pkgver=4.17.5.3
pkgrel=1
pkgdesc="Jonathan's Own Version of Emacs is an Emacs-like editor without Lisp."
url="https://github.com/jonmacs/jove"
license=('custom')
arch=('i686' 'x86_64')
depends=('ncurses' 'bash')
makedpends=('pkgconf')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz" jmake.patch)
sha256sums=('ca5a5fcf71009c7389d655d1f1ae8139710f6cc531be95581e4b375e67f098d2'
            '381638fcdb02d36ec311a8c3ce404257635c78854004ee4cd7b78a9a690877eb')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < "$srcdir"/jmake.patch
}

build() {
  cd $pkgname-$pkgver
  ./jmake.sh
}

package() {
  cd $pkgname-$pkgver
  ./jmake.sh JOVEHOME=/usr DESTDIR="$pkgdir" MANDIR=/usr/share/man  install
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/jove/LICENSE
  chmod o-w "$pkgdir"/var/lib/jove/preserve
}
