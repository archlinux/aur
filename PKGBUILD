# Maintainer: Adria Arrufat <adria.arrufat+AUR@protonmail.ch>
# Contributor: Philipp Trommler <ph.trommler@gmail.com>
pkgname=valum
pkgver=0.3.15
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
source=("https://github.com/valum-framework/valum/archive/v${pkgver}.tar.gz")
md5sums=('be94d137167b98753912d85da516a78f')

build() {
  cd ${pkgname}
  [ -d build ] && rm -rf build
  mkdir build && cd build
  meson --prefix=/usr ..
  ninja
}

package() {
  cd ${pkgname}/build
  DESTDIR=${pkgdir} ninja install
  install -Dm644 ${srcdir}/valum/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
