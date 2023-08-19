# Maintainer:  Trần Nam Tuấn <tuantran1632001@gmail.com>
# Contributor: Jona Miller <miller dot jona at yandex dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='headsetcontrol'
_pkgname='HeadsetControl'
pkgver=2.7.0
pkgrel=2
pkgdesc='Sidetone and Battery status for Logitech G930, G533, G633, G933 SteelSeries Arctis 7/PRO 2019 and Corsair VOID (Pro) in Linux and MacOSX '
arch=('x86_64')
url='https://github.com/Sapd/HeadsetControl'
provides=("${pkgname}")
license=('GPL3')
depends=('hidapi')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('57ef523fa469b77f93d31bb2283d4fdb2e612c7f9822f958fb1f59fd67149529')

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B 'build' -S "${_pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C 'build'
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' -C 'build' install
  install -Dvm644 "${_pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
