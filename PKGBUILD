# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=abcl
pkgver=1.7.0
pkgrel=1
pkgdesc="Full implementation of the Common Lisp language in the JVM"
arch=('any')
url="http://common-lisp.net/project/armedbear/"
license=('GPL')
depends=('sh' 'java-environment<=11')
makedepends=('ant' 'net-tools')
provides=('common-lisp')
source=("http://abcl.org/releases/$pkgver/$pkgname-src-$pkgver.tar.gz" abcl.sh)
sha256sums=('ffabe6b36075dbf7982c6e4e3bfeca0fb771053143740735333f3f20ea8613be'
            '8afb6578b1ac5b25a7b270069e81e1e99da6bfac661eadfc97e61acb43f5f3b0')

build() {
  cd $pkgname-src-$pkgver
  ant
}

package() {
  cd $pkgname-src-$pkgver
  install -Dm755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 dist/$pkgname.jar "$pkgdir"/usr/share/java/$pkgname.jar
  install -Dm644 dist/$pkgname-contrib.jar \
    "$pkgdir"/usr/share/java/$pkgname-contrib.jar
}
