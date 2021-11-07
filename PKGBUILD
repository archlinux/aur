# Maintainer: Gabriele Musco <gabmus@disroot.org>
# Upstream URL: https://gitlab.com/gabmus/syndication-domination

pkgname=python-syndom-git
pkgver=3f92efe
pkgrel=1
pkgdesc="A simple RSS/Atom parser library in C++, with python bindings"
arch=('any')
url="https://gitlab.com/gabmus/syndication-domination"
license=('AGPL3')
depends=('python' 'pugixml' 'pybind11')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://gitlab.com/GabMus/syndication-domination.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson \
      -Dpython_bindings=true \
      -Dto_json_binary=false \
      "${pkgname%-git}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

