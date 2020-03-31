# Maintainer: Dmytro Kostiuchenko <edio@archlinux.us>
_name=gimp-plugin-lqr
_srcname=gimp-lqr-plugin
pkgname=${_name}-git
pkgver=v0.7.0.r14.g61d1f07
pkgrel=1
pkgdesc="Plugin for The GIMP providing Liquid Rescale. Latest git "
arch=('x86_64')
url="https://liquidrescale.wikidot.com/"
license=('GPL')
provides=('gimp-plugin-lqr')
conflicts=('gimp-plugin-lqr')
depends=('gimp' 'liblqr')
makedepends=('intltool' 'patch')
source=(git+https://github.com/carlobaldassi/gimp-lqr-plugin.git)

md5sums=('SKIP')

pkgver() {
  cd "$_srcname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/"$_srcname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/"$_srcname"
  make DESTDIR="$pkgdir" install
}

