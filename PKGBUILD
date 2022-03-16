# Maintainer: David Runge <dvzrv@archlinux.org>

_name=new-session-manager
pkgname=new-session-manager-git
pkgver=1.5.3.r13.g7099c9f
pkgrel=1
pkgdesc="Audio session manager"
arch=(x86_64)
url="https://github.com/jackaudio/new-session-manager"
license=(GPL3)
depends=(gcc-libs glibc)
makedepends=(fltk git jack liblo meson)
optdepends=('fltk: for nsm-legacy-gui')
provides=(new-session-manager)
conflicts=(new-session-manager)
options=(debug)
source=(git+https://github.com/jackaudio/$_name)
sha512sums=('SKIP')
b2sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

build() {
  arch-meson build $_name
  ninja -C build
}

package() {
  depends+=(libjack.so liblo.so)

  DESTDIR="$pkgdir" meson install -C build
  install -vDm 644 $_name/{CHANGELOG,README.md} -t "$pkgdir/usr/share/doc/$_name/"
}
