# Maintainer: willemw <willemw12@gmail.com>
# Contributor: totoloco <totoloco at gmail dot com>

_pkgname=pmus
pkgname=$_pkgname-git
pkgver=0.42.r298.gd5a51ca
pkgrel=1
pkgdesc="Practical Music Search is a highly configurable, ncurses-based client for MPD"
arch=('i686' 'x86_64')
url="https://ambientsound.github.io/pms/"
license=('GPL')

# Enable boost_regex
#makedepends=('boost')
#depends=('boost-libs' 'intltool' 'libmpdclient' 'ncurses')

depends=('intltool' 'libmpdclient' 'ncurses')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/ambientsound/pms.git)
md5sums=(SKIP)

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname

  # Enable boost_regex
  #sed -i 's|^./configure[ ]*$|./configure --enable-regex --prefix=/usr|' rebuild.sh

  sed -i 's|^./configure[ ]*$|./configure --prefix=/usr|' rebuild.sh
}

build() {
  cd $pkgname
  ./rebuild.sh
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
  install -dm755 "$pkgdir/usr/share/pms/examples"
  install -m644 examples/* "$pkgdir/usr/share/pms/examples"
}

