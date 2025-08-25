# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer:  artist for XLibre

_basename="xf86-input-void"
pkgname="${_basename//xf86/xlibre}"
pkgver=1.4.2.2
pkgrel=2
pkgdesc="XLibre void input driver"
arch=('aarch64' 'x86_64')
url="https://github.com/X11Libre/${_basename}"
license=('custom')
depends=('glibc')
makedepends=('xlibre-xserver-devel' 'xorgproto' 'X-ABI-XINPUT_VERSION=26.0')
provides=("${_basename}")
conflicts=("${_basename}" 'xorg-server<21.1.1' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')
groups=('xlibre-drivers')
_pkgsrc="${_basename}-xlibre-${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/xlibre-${_basename}-${pkgver}.tar.gz")
b2sums=('23a9a9423eb395d84f67febc9df2388002d45d1cbe8abfeda9728c3d8a158b573e8e285829e82ee38b3ea7546c5abd4f5c9a4a09b7314506d0c5a2214c1e8fdb')

build() {
  local configure_options=(
    --prefix='/usr'
  )

  cd "${srcdir}/${_pkgsrc}"
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
