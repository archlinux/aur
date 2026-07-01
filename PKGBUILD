pkgname=picoc-git
pkgver=2.2
pkgrel=3
pkgdesc="A very small C interpreter for scripting."
arch=('x86_64')
url="https://gitlab.com/zsaleeba/picoc"
license=('BSD-3-Clause')
source=("git+https://gitlab.com/zsaleeba/picoc.git")
options=('!buildflags')
md5sums=('SKIP')
 
build() {
  cd "${srcdir}/picoc"
  # Needs gnu extensions to compile, doesn't work with c20 or later
  sed -i 's/^CFLAGS=/CFLAGS= -std=gnu17 /' Makefile
  make
}
 
package() {
  cd "${srcdir}/picoc"
  install -D picoc "$pkgdir/usr/bin/picoc"
  # License is embedded in the README file, so we copy all of it
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm644 README -t "$pkgdir/usr/share/licenses/$pkgname/"
}
