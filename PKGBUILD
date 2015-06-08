# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=websockify-git
_gitname=websockify
pkgver=667.23045cb
pkgrel=1
pkgdesc="WebSocket to TCP proxy/bridge."
arch=('i686' 'x86_64')
url="http://github.com/kanaka/websockify"
license=('LGPL3')
depends=( 'python2' 'python2-numpy' 'python2-setuptools' )
provides=( "$_gitname" )
conflicts=( "$_gitname" )
source=("${_gitname}::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_gitname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_gitname}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  make
  install -Dm755 rebind.so "$pkgdir/usr/bin/rebind.so"
}

# vim:set ts=2 sw=2 et:
