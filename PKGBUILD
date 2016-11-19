# Maintainer : Antoine Carpentier
pkgname=asdf
pkgver=3.1.7
pkgrel=1
pkgdesc="A build facility for Common Lisp"
arch=('any')
url="https://common-lisp.net/project/asdf/"
license=("mit")
optdepends=('sbcl' 'ccl-svn')
source=("git+https://gitlab.common-lisp.net/$pkgname/$pkgname.git")
sha256sums=('SKIP')
install=$pkgname.install

build()
{
  cd "$srcdir/$pkgname"
  sh make-asdf.sh 
}

package()
{
  mkdir -p $pkgdir/usr/lib/$pkgname
  install -m 644 "$srcdir/$pkgname/build/asdf.lisp" "$pkgdir/usr/lib/$pkgname/asdf.lisp"
  mkdir -p $pkgdir/etc/default
  echo -ne "(load \"/usr/lib/$pkgname/asdf\")\n" > $pkgdir/etc/default/$pkgname
}

# vim:set ts=2 sw=2 et:

