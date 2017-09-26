# Maintainer: Bjorn Pagen <bjornpagenatgmailcom>
# Maintainer: Justin R. St-Amant <jstamant24 at gmail dot com>
pkgname=googlecl-git
pkgver=0.9.15
pkgrel=1
pkgdesc="Command line utility to use google services"
arch=('any')
url="https://github.com/vinitkumar/googlecl"
license=('APACHE')
depends=('python2'
		 'python2-oauth2client'
		 'python2-gdata'
		 'python2-httplib2')
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
  sed -i -e 's#client_secret.json#/usr/lib/python2.7/site-packages/googlecl/client_secret.json#g' src/googlecl/authenticate.py
  python2 setup.py install --prefix=/usr --root=$pkgdir
  install -m644 client_secret.json $pkgdir/usr/lib/python2.7/site-packages/googlecl/client_secret.json
}
