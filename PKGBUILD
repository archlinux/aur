pkgname=pxdo-git
pkgver=5a6536b
pkgrel=1
pkgdesc="Python script for querying X-server information and manipulating X-windows"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/xhsdf/rtile"
license=('GPL')
depends=('python-xlib')
makedepends=('git')
conflicts=('pxdo')
provides=('pxdo')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/falconindy/expac.git'
source=("$pkgname"::'git+https://github.com/xhsdf/pxdo.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --always --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "pxdo.py" "$pkgdir/usr/bin/pxdo.py"
}
