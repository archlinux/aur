# Contributor: zhuqin <zhuqin83@gmail.com>
pkgname=lensfun-git
_gitname=lensfun
pkgver=0.3.0.r56.ge4a7da7
pkgrel=1
pkgdesc="Library to correct optical lens defects and lens database"
arch=(i686 x86_64)
url="http://lensfun.sourceforge.net"
license=('LGPL3')
depends=('glibc' 'glib2')
makedepends=('python2' 'libpng' 'cmake')
provides=('lensfun=0.3.0')
conflicts=('lensfun')
source=("lensfun::git://git.code.sf.net/p/lensfun/code")
md5sums=(SKIP)

pkgver() {
  cd $_gitname
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd $_gitname
    cmake -DLENSFUN_INSTALL_PREFIX=$pkgdir/usr \
	  -DCMAKE_BUILD_TYPE=Release \
	  .
    make
}

package() {
  cd $_gitname
  make INSTALL_PREFIX="$pkgdir/" install
}
