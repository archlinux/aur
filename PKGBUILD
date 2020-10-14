# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='zeit'
pkgname="${_pkgname}-git"
pkgver=0.5.0.r13.g8ee712b
pkgrel=1
pkgdesc='Qt frontend to at and crontab CLI utilities'
arch=('x86_64')
url='https://github.com/loimu/zeit'
license=('GPL3')
depends=('kauth')
makedepends=('cmake' 'cron' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B 'build' -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C 'build'
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' -C 'build' install
  install -Dvm644 "${_pkgname}/Readme.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

# vim: ts=2 sw=2 et:
