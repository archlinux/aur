# Original author: Thomas Sowell <tom@fancydriving.org>
# Maintained by Joseph Riches

pkgname=libgestures
pkgdesc="Chromium OS gestures library"
pkgver=2.0.3
pkgrel=4
arch=(i686 x86_64)
url="http://github.com/galliumos/libgestures"
license=('custom:chromiumos')
_gitname='libgestures'
provides=('libgestures=$pkgver')
depends=('jsoncpp')
makedepends=('git')

source=("$_gitname::git+https://github.com/galliumos/libgestures.git")

md5sums=('SKIP')

prepare() {
  cp "$startdir"/finger_metrics_math.patch "$srcdir/$_gitname"
  cd "$srcdir/$_gitname"
  patch -p1 < finger_metrics_math.patch
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  make -C "$srcdir/$_gitname" DESTDIR="${pkgdir}" install
  rm -fr ${pkgdir}/etc

  install -m 644 -D ${srcdir}/${_gitname}/LICENSE ${pkgdir}/usr/share/license/${pkgname}/LICENSE
}
