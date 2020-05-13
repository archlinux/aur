# Maintainer: Sean Greenslade <aur AT seangreenslade DOT com>

_pkgname=weave-minimal
pkgname=$_pkgname-git
pkgver=1.5.r8.g503072a
pkgrel=2
pkgdesc="minimal weave 1.1 server for Pale Moon sync"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/zootboy/weave-minimal"
license=('custom')
depends=('python' 'python-werkzeug')
#makedepends=('python2')
optdepends=('python-gevent: better concurrency support')
provides=('weave-minimal')
conflicts=('weave-minimal')
source=("git+https://github.com/zootboy/weave-minimal")
install=$_pkgname.install
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
}

build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 $srcdir/$_pkgname/examples/weave-minimal.conf "$pkgdir/etc/weave-minimal.conf"
  install -Dm644 $srcdir/$_pkgname/examples/weave-minimal.service "$pkgdir/usr/lib/systemd/system/weave-minimal.service"

  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
