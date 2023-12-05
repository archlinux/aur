# Maintainer: Tarn W. Burton <twburton@gmail.com>

pkgname=abcl-git
pkgver=r3771.91f48d55
pkgrel=1
pkgdesc="Full implementation of the Common Lisp language in the JVM"
arch=('any')
url="http://common-lisp.net/project/armedbear/"
license=('GPL')
depends=('java-runtime' 'bash')
makedepends=('ant' 'net-tools' 'git' 'inetutils' 'java-environment>=11')
provides=('abcl' 'common-lisp')
conflicts=('abcl')
source=("abcl.git::git+https://gitlab.common-lisp.net/abcl/abcl.git" abcl.sh)
sha256sums=('SKIP'
            '8afb6578b1ac5b25a7b270069e81e1e99da6bfac661eadfc97e61acb43f5f3b0')

pkgver() {
  cd ${pkgname%-git}.git
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
