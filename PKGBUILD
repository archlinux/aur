# Contributor: Max Devaine <maxdevaine@gmail.com>
# Contributor: Christopher Snowhill <chris@kode54.net>

pkgbase=multivnc-git
pkgname=$pkgbase
pkgver=MultiVNC.0.3.r845.gcb26df0
pkgrel=1
pkgdesc='MultiVNC is a cross-platform Multicast-enabled VNC viewer using wxWidgets and libvncclient'
arch=(i686 x86_64)
url='http://github.com/bk138/multivnc'
license=('GPL')
makedepends=('git')
conflicts=('multivnc')
provides=('multivnc')

source=("$pkgname"::'git+https://github.com/bk138/multivnc.git'
        "git+https://github.com/bk138/wxservdisc.git"
        "git+https://github.com/LibVNC/libvncserver.git")

md5sums=('SKIP'
         'SKIP'
         'SKIP')

prepare() {
  cd $srcdir/$pkgname
  git submodule init
  git config submodule.wxservdisc.git.url $srcdir/wxservdisc
  git config submodule.libvncserver.git.url $srcdir/libvncserver
  git submodule update
}


pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "$srcdir/$pkgname"

  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  cmake --build .

}

package() {
cd "$srcdir/$pkgname/build"
make DESTDIR="$pkgdir" install
}

#category: network
# vim:set ts=2 sw=2 et:
