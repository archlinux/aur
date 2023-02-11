# Maintainer: tuberry
# Contributor: simsilver

_version=1.0.0
_srcname=dict-ecdict
pkgname=${_srcname}-git
pkgver=1.0.0.r15.3ebdb22
pkgrel=1
pkgdesc="A port of Ultimate ECDICT database for dictd et al."
arch=(any)
url=https://github.com/skywind3000/ECDICT-ultimate
license=(MIT)
depends=(dictd)
makedepends=(dictd git curl meson unzip)
provides=(${_srcname})
conflicts=(${_srcname})
install=${pkgname}.install
source=(git+https://github.com/tuberry/${_srcname})
sha512sums=(SKIP)

pkgver() {
  cd ${_srcname}
  printf "%s.r%s.%s" ${_version} $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
    arch-meson $_srcname build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
