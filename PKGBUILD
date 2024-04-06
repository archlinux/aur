# Contributor: dreieck (https://aur.archlinux.org/account/dreieck/)
# Contributor: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname='xf86-input-joystick'
pkgname="${_pkgname}"
pkgver=1.6.4
pkgrel=5
pkgdesc="X.Org input driver that translates joystick input to mouse and keyboard events. (Do not use for games with native joystick support or XI2 applications. See manpage.)"
arch=(
  'i686'
  'x86_64'
)
url="https://www.x.org/wiki/"
license=(
  'LicenseRef-custom'
)
depends=(
  'glibc'
)
makedepends=(
  'xorg-server-devel'
  'xorgproto'
  'X-ABI-XINPUT_VERSION>=24.2'
  'X-ABI-XINPUT_VERSION<25'
)
provides=()
conflicts=(
  'X-ABI-XINPUT_VERSION<24.2'
  'X-ABI-XINPUT_VERSION>=25'
)
validpgpkeys=(
  '4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E'
  'CFDF148828C642A7' # Subkey of the above. Alan Coopersmith <alan.coopersmith@oracle.com>
)
source=(
  "https://www.x.org/releases/individual/driver/xf86-input-joystick-${pkgver}.tar.xz"
  "https://www.x.org/releases/individual/driver/xf86-input-joystick-${pkgver}.tar.xz.sig"
  '50-joystick-example.conf'
)
sha256sums=(
  '905ec485fabc699b1cb21518cbd152246776fa83570e09c5822ca0973733ccd2'
  '63cfdfc31bc549fdb5b489bd9e0adaa1077f9fbb83d771d6ced2640bec177c72'
  'b516eb15d4d37149a4710cf70f1a9c9ca6b5d03ea4b68f43f923571384adf09c'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dvm644 "${srcdir}/50-joystick-example.conf" "${pkgdir}/usr/share/doc/${_pkgname}/example/xorg.conf.d/50-joystick-example.conf"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" ChangeLog INSTALL README.md

  install -Dvm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
