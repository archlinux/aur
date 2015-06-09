# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=apache-websocket-git
pkgver=r21.cfaef07
pkgrel=1
pkgdesc="An Apache WebSocket module"
license=('APACHE')
arch=('i686' 'x86_64')
url="http://github.com/disconnect/apache-websocket.git"
depends=('apache' 'apr')
makedepends=('git' 'scons')
source=("$pkgname::git+https://github.com/disconnect/apache-websocket.git"
'SConstruct.patch')
md5sums=('SKIP'
         '1f6b38c53af97911db6a6dbd01fc3750')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  patch --verbose -p0 -i ../../SConstruct.patch
  scons
}

package() {
  cd "$_buildroot"
  install -d "$pkgdir"/usr/lib/httpd/modules
  install -m 755 "$srcdir/$pkgname"/mod_websocket{,_draft76}.so "$pkgdir"/usr/lib/httpd/modules/
}

# vim:set ts=2 sw=2 et:
