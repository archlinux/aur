# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='haruna'
pkgver=0.3.1
pkgrel=1
pkgdesc='Video player built with Qt/QML on top of libmpv.'
arch=('x86_64')
url='https://github.com/g-fb/haruna'
license=('GPL3')
depends=('kfilemetadata' 'kxmlgui' 'mpv' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('b1a5307177810941a164b8da82f437cf83709904f71240b25263edca7b3c2847')

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
