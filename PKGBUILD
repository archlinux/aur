# Maintainer: Thibault Saunier <tsaunier@gnome.org>

pkgname=dssim-git
pkgrel=1.1
pkgver=1
pkgdesc=" DSSIM C implementation"
arch=('x86_64')
url="https://github.com/pornel/dssim/"
license=(AGPL)
depends=()
makedepends=('ninja')
source=('git+https://github.com/pornel/dssim.git')
sha256sums=('SKIP')

build() {
  cd "$srcdir"/dssim
  mkdir build
  cd build
  meson ../ --prefix=/usr --libdir=lib/
  ninja
}

package() {
  cd "$srcdir"/dssim/build
  DESTDIR="$pkgdir/" ninja install
}

pkgver() {
  cd "$srcdir"/dssim
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
