# Contributor : Antoine Carpentier
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=quicklisp
pkgver="20150128"
pkgrel=2
pkgdesc="A library manager for Common Lisp"
arch=('any')
url="https://www.quicklisp.org"
license=('custom:bsd')
optdepends=('sbcl' 'ccl')
makedepends=('sbcl')
source=('https://beta.quicklisp.org/quicklisp.lisp')
sha256sums=('4a7a5c2aebe0716417047854267397e24a44d0cce096127411e9ce9ccfeb2c17')
install=$pkgname.install

pkgver() {
  echo $(awk '/qlqs-info/ {print $3}' $pkgname.lisp |tr -d - |tr -d \))
}

package() {
  echo -ne "(quicklisp-quickstart:install :path \"$pkgdir/usr/lib/$pkgname\")\n(quit)\n" | sbcl --no-userinit --load $pkgname.lisp
  chmod 777 -R "$pkgdir"/usr/lib/$pkgname/dists
  chmod 777 -R "$pkgdir"/usr/lib/$pkgname/local-projects
  install -d "$pkgdir"/etc/default
  echo -ne "(load \"/usr/lib/$pkgname/setup\")\n" > "$pkgdir"/etc/default/$pkgname
}
