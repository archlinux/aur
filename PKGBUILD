# Maintainer: Adria Arrufat <adria.arrufat+AUR@protonmail.ch>
# Contributor: Philipp Trommler <ph.trommler@gmail.com>
pkgname=valum
pkgver=0.3.0
pkgrel=1
pkgdesc="Web micro-framework written in Vala"
arch=("i686" "x86_64")
url="https://github.com/valum-framework/valum"
license=("LGPL3")
depends=(vala glib2 libsoup libgee ctpl fcgi)
optdepends=("libmemcached: For memcached cache storage."
            "memcached: For memcached cache storage."
            "luajit: For an embedded Lua VM.")
makedepends=(git ninja vala meson)
_commit=30c2b15f26cabbd62aa279deb88b652e43d05f0a
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
  meson --prefix=${pkgdir}/usr ..
  ninja
}

check() {
  cd ${pkgname}/build
  ninja test
}

package() {
  cd ${pkgname}/build
  ninja install
  cd ${srcdir}/valum
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
