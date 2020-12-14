# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='headsetcontrol'
pkgver=2.3
pkgrel=1
pkgdesc='Sidetone and Battery status for Logitech G930, G533, G633, G933 SteelSeries Arctis 7/PRO 2019 and Corsair VOID (Pro)'
arch=('x86_64')
url='https://github.com/Sapd/HeadsetControl'
license=('GPL3')
depends=('hidapi')
makedepends=('cmake' 'git')
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

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
}

# vim: ts=2 sw=2 et:
