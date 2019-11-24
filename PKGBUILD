# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=abcl-git
pkgver=3232.91f3c21b
pkgrel=1
pkgdesc="Full implementation of the Common Lisp language in the JVM"
arch=('any')
url="http://common-lisp.net/project/armedbear/"
license=('GPL')
depends=('java-runtime<=11' 'bash')
makedepends=('ant' 'net-tools' 'subversion' 'java-environment>=11')
provides=('abcl' 'common-lisp')
conflicts=('abcl')
source=("abcl.git::git+https://gitlab.common-lisp.net/abcl/abcl.git" abcl.sh)
md5sums=('SKIP' 'd51ffd115b32f9a47f849fc7630ced4f')

pkgver() {
  cd ${pkgname%-git}.git
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-git}.git
  ant
}

package() {
  cd ${pkgname%-git}.git
  install -Dm755 "$srcdir"/abcl.sh "$pkgdir"/usr/bin/abcl
  install -Dm644 dist/abcl.jar "$pkgdir"/usr/share/java/abcl.jar
  install -Dm644 dist/abcl-contrib.jar \
	  "$pkgdir"/usr/share/java/abcl-contrib.jar
}
