# Maintainer: Joel Noyce Barnham <joelnbarnham@gmail.com>
pkgname=flux-git
pkgver=1.4.4.r0.e45758a
pkgrel=1
pkgdesc="flux is an interface description language used by DirectFB"
arch=('x86_64')
url="https://github.com/deniskropp/flux"
license=('GPL3')
groups=()
depends=('gcc-libs')
makedepends=('git')
provides=("fluxcomp")
conflicts=()
replaces=()
backup=()
options=()
install=
source=("flux::git+${url}.git#branch=master")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/flux"
  printf "%s" "$(awk -F= '/^FLUXCOMP_(MAJOR|MINOR|MICRO)_VERSION/ { printf "%s.", $2; }' configure.in | sed 's/.$//').r0.$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/flux"
  autoreconf -fi
  ./configure
  make
}

package() {
  cd "${srcdir}/flux"
  install -D -m 0755 src/fluxcomp "${pkgdir}/usr/bin/fluxcomp"
  install -D -m 0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
