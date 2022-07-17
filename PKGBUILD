# Maintainer:  <castix at autistici dot org>
pkgname=delta-limiter-lv2-git
pkgver='2.2'
pkgrel=1
epoch=
pkgdesc=""
arch=('i686' 'x86_64')
url="https://github.com/hannesbraun/delta-limiter"
license=('custom')
groups=('lv2-plugins')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("${pkgname%-lv2--git}")
conflicts=("${pkgname%-lv2-git}")
source=('delta-limiter-lv2::git+https://github.com/hannesbraun/delta-limiter')
md5sums=('SKIP')


build() {
  cd "$srcdir"
  mkdir -p build
  cd build
  cmake "../${pkgname%-git}"
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir/" install
  
  # there should be an evironment variable to avoid doing this mv
  # doing this becuse of namcap complaints about local being non-standard
  mv "${pkgdir}/usr/local/lib" "${pkgdir}/usr/lib"
  rmdir "${pkgdir}/usr/local"
  
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp "../${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
