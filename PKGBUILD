_gitname=ots
pkgname=${_gitname}-git
pkgver=324.b444494
pkgver() { cd $_gitname && echo $(git rev-list --count master).$(git rev-parse --short master); }
pkgrel=1
pkgdesc="OpenType fonts sanitiser. Supports TTF, WOFF, WOFF2 and other formats."
arch=('i686' 'x86_64')
url="https://github.com/khaledhosny/ots"
license=('custom')
depends=('zlib')
makedepends=('git')
provides=('ots')
conflicts=('ots')
source=('git://github.com/khaledhosny/ots.git')
md5sums=(SKIP)

build() {
  cd $_gitname
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
