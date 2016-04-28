# Maintainer: Iru Cai <mytbk920423@gmail.com>
# build for gimp-git, with gegl support

pkgname=libmypaint-git
pkgver=1.1.r591
pkgrel=1
pkgdesc="a library for making brushstrokes which is used by MyPaint and other projects"
arch=('i686' 'x86_64')
url="http://mypaint.org/"
license=('ISC')
depends=('gegl' 'babl' 'json-c')
makedepends=('scons' 'python')
source=('git+https://github.com/mypaint/libmypaint.git')
md5sums=('SKIP')

build() {
  true
}

package() {
  cd "$srcdir/libmypaint"

  scons prefix=/usr enable_gegl=true use_sharedlib=yes \
        --install-sandbox="$pkgdir" "$pkgdir"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cp COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
  cd "$srcdir/libmypaint"

  ver=1.1 # use the brushlib_version in SConscript
  count=$(git rev-list --count HEAD)
#  commit=$(git rev-parse --short HEAD)
  echo $ver.r$count
}

# vim:set ts=2 sw=2 et:
