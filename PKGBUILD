# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=afterstep-git
_name=AfterStep
_pkgname=afterstep
pkgver=2.2.12.r11.g8e4c423
pkgrel=1
pkgdesc="A Window Manager based on NextStep Interface"
arch=('i686' 'x86_64')
url="http://www.afterstep.org"
license=('GPL')
depends=('gtk2>=2.18.6' 'libpng' 'libtiff' 'readline' 'freetype2' 'dbus-core' 'librsvg')
makedepends=('libxt')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!emptydirs')
source=("$_pkgname::git+https://github.com/sashavasko/afterstep-devel.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr --mandir=/usr/share/man
  make V=0
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 $_name.desktop "$pkgdir/usr/share/xsessions/$_name.desktop"
  
  # fix permission
  chmod 644 "$pkgdir"/usr/lib/*.a
}

