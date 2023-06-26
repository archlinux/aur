# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=nanonote
pkgver=1.4.0
pkgrel=1
pkgdesc='Minimalist note taking application'
arch=('x86_64')
url='https://github.com/agateau/nanonote'
license=('BSD')
depends=('hicolor-icon-theme' 'qt5-base')
makedepends=('extra-cmake-modules' 'git' 'python-jinja' 'python-pyaml' 'qt5-tools')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')


prepare() {
  cd "${pkgname}"
  git submodule init
  git submodule update
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B 'build' -S "${pkgname}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C 'build'
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' -C 'build' install
  install -Dvm644 "${pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 "${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
