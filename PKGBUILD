# Maintainer: Ganymede < ganymede _AT_ analogon _DOT_ eu>

pkgname=reed-alert-git
_pkgname=reed-alert
pkgver=r84.e220c32
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="reed-alert is a small and simple monitoring tool for your server, written in Common Lisp"
arch=('any')
optdepends=('ecl' 'sbcl')
url="https://dataswamp.org/~solene/2018-01-17-reed-alert.html"
license=('custom')
source=('git://bitreich.org/reed-alert')
md5sums=('SKIP')
install=reed-alert-git.install

build() {
  cd "$_pkgname"
  sed -i -e 's:/usr/local:/usr:' Makefile
  sed -i -e 's/-o root -g bin//' Makefile
  sed -i -e 's/-o root -g wheel//' Makefile
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm644 example-full.lisp "$pkgdir"/usr/share/doc/$pkgname/example-full.lisp
  install -Dm644 example-simple.lisp "$pkgdir"/usr/share/doc/$pkgname/example-simple.lisp
}
