# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="xf86-input-synaptics"
pkgname="${_basename//xf86/xlibre}"
# pkgver=1.10.0.1
pkgver=1.10.0
pkgrel=2
pkgdesc="XLibre Synaptics driver for notebook touchpads"
arch=('aarch64' 'x86_64')
url="https://github.com/X11Libre/${_basename}"
license=('MIT')
depends=('glibc' 'libevdev>=0.4' 'libx11' 'libxi' 'libxtst')
makedepends=('xlibre-server-devel' 'xorgproto' 'X-ABI-XINPUT_VERSION=26.0')
# provides=("${_basename}" 'synaptics')
conflicts=("${_basename}" 'synaptics' 'xorg-server<21.1.2' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')
# replaces=('synaptics')
groups=('xlibre-drivers')
install="${pkgname}.install"
# _pkgsrc="${_basename}-xlibre-${_basename}-${pkgver}"
# source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/xlibre-${_basename}-${pkgver}.tar.gz")
_pkgsrc="${_basename}-${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/xf86-input-synaptics-1.10.0.tar.gz")
b2sums=('d8079db5ca672c449d23972ffbe238c081cfcad3bee3cd9a9d7851b9efd2f841ad0b05eb3e6c9d6be4081187988fa4eabc4ef5fb88889af53a5aa2440312b1ff')

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
