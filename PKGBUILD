# Maintainer: Justin R. St-Amant <jstamant24 at gmail dot com>
pkgname=googlecl-git
pkgver=0.9.15
pkgrel=1
pkgdesc="Command line utility to use google services"
arch=('any')
url="https://github.com/vinitkumar/googlecl"
license=('APACHE')
depends=('python'
         'python2'
		 'python2-oauth2client')
makedepends=('git')
provides=('googlecl')
conflicts=('googlecl')
source=("$pkgname::git+https://github.com/vinitkumar/googlecl.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  rm src/google
  python2 setup.py install --prefix=/usr --root=$pkgdir
  install -Dm644 docs/man/google.1 "$pkgdir/usr/share/man/man1/google.1"
}
