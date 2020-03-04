# Maintainer:  Joshua Holmer <jholmer.in@gmail.com>

_plug=tonemap
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r6.5a037ae
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/ifb/vapoursynth-tonemap'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/ifb/vapoursynth-tonemap.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_plug}"
  ./autogen.sh
}

build() {
  cd "${_plug}"
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth
  make
}

package() {
  cd "${_plug}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
