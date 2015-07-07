# Original author: Thomas Sowell <tom@fancydriving.org>
# Maintained by Joseph Riches

pkgname=libgestures
pkgdesc="Chromium OS gestures library"
pkgver=2.0.3
pkgrel=3
arch=(i686 x86_64)
url="http://github.com/hugegreenbug/libgestures"
license=('custom:chromiumos')
_gitname='libgestures'
provides=('libgestures=$pkgver')
depends=('jsoncpp')
makedepends=('git')

source=("$_gitname::git+https://github.com/hugegreenbug/libgestures.git")

md5sums=('SKIP')

prepare() {
  cd "$srcdir/$_gitname"
  sh apply_patches.sh
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
