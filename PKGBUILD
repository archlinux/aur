# Maintainer: Adria Arrufat <adria.arrufat+AUR@protonmail.ch>
# Contributor: Philipp Trommler <ph.trommler@gmail.com>
pkgname=valum
pkgver=0.3.3
pkgrel=1
pkgdesc="Web micro-framework written in Vala"
arch=("i686" "x86_64")
url="https://github.com/valum-framework/valum"
license=("LGPL3")
depends=(glib2 libsoup vala)
optdepends=("libmemcached: For memcached cache storage."
            "memcached: For memcached cache storage."
            "luajit: For an embedded Lua VM.")
makedepends=(git meson python-sphinx vala valadoc)
_commit=35d1bcfe9bdc5307a1c263c5d9fa86dafef1b187
source=("git://github.com/valum-framework/valum.git#commit=${_commit}")
md5sums=("SKIP")

pkgver() {
  cd ${pkgname}
  git describe --tags | sed 's/-/+/g;s/^v//'
}

build() {
  cd ${pkgname}
  [ -d build ] && rm -rf build
  mkdir build && cd build
  meson --prefix=/usr ..
  ninja
}

check() {
  cd ${pkgname}/build
  ninja test
}

package() {
  cd ${pkgname}/build
  DESTDIR=${pkgdir} ninja install
  install -Dm644 ${srcdir}/valum/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
