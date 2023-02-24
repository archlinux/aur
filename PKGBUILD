# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Loui Chang <louipc [dot.] ist [at@] gmail.com>
# Contributor: aksr <aksr at t-com dot me>

pkgname=jove
pkgver=4.17.5.1
pkgrel=2
pkgdesc="Jonathan's Own Version of Emacs is an Emacs-like editor without Lisp."
url="https://github.com/jonmacs/jove"
license=('custom')
arch=('i686' 'x86_64')
depends=('ncurses' 'bash')
makedpends=('pkgconf')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz" jmake.patch)
sha256sums=('674fe3784c9aa58e1fbe010c7da8e026bffa5e057ab30341333a2dbcaf12887b'
            '330d07de9d4bae086787294781aa3293238298fe8c1e4d5c444d79e666409654')

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
