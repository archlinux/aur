# Maintainer: username227 <gfrank [at] gmail [dot] com>

_pkgname=xenity
pkgname=${_pkgname}-git
pkgver=3.44.6.r0.gb6407b3
pkgrel=1
pkgdesc="GTK3 drop-in replacement for Zenity 3.44"
arch=('x86_64')
url="https://github.com/xapp-project/xenity"
license=('LGPL-2.1-or-later')
depends=('gtk3' 'glib2' 'glibc' 'libx11')
makedepends=('git' 'meson' 'ninja' 'pkgconf')
provides=('xenity')
conflicts=('xenity')
source=('git+https://github.com/xapp-project/xenity.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
  arch-meson xenity build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

