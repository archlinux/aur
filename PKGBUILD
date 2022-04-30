# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=abcl
pkgver=1.9.0
pkgrel=1
pkgdesc="Full implementation of the Common Lisp language in the JVM"
arch=('any')
url="https://common-lisp.net/project/armedbear/"
license=('GPL')
depends=('sh' 'java-environment')
makedepends=('ant' 'net-tools' 'inetutils')
provides=('common-lisp')
source=("https://abcl.org/releases/$pkgver/$pkgname-src-$pkgver.tar.gz" abcl.sh)
sha256sums=('5c0a915e2b43f54eb12d09b20e45d3efe4d995ca63e7f0b91b57e193f85c1124'
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
