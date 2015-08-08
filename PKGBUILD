_gitname=daala
#pkgname=libdaala-git # Former AUR3 name
pkgname=${_gitname}-git
pkgver=556.f79a2f0
pkgver() { cd $_gitname && echo $(git rev-list --count master).$(git rev-parse --short master); }
pkgrel=2
pkgdesc="Daala is next-next-gen video compression technology from Xiph.org, Mozilla and others."
arch=('i686' 'x86_64')
url="https://www.xiph.org/daala/"
license=('BSD')
depends=('libogg' 'libpng')
makedepends=('git' 'check')
provides=('libdaala')
conflicts=('libdaala')
options=('!libtool')
source=('git://git.xiph.org/daala.git')
md5sums=('SKIP')

build() {
  cd $_gitname
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
