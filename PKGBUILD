# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='haruna'
pkgver=0.4.1
pkgrel=1
pkgdesc='Video player built with Qt/QML on top of libmpv.'
arch=('x86_64')
url='https://github.com/g-fb/haruna'
license=('GPL3')
depends=('kfilemetadata' 'kio' 'mpv' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('42410aad583c0a3377625dbbcbc9cf7b7eb3b3f724b8663b7bb747c98798a875')

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B 'build' -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C 'build'
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' -C 'build' install
  install -Dvm644 "${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
