# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tobias Powalowski  <tpowa@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=xlibre-input-synaptics
_pkgname=xf86-input-synaptics
pkgver=25.0.0
pkgrel=8
pkgdesc="XLibre Synaptics driver for notebook touchpads"
arch=('x86_64')
license=('MIT')
url='https://github.com/X11Libre/xf86-input-synaptics'
depends=('libxtst' 'libevdev' 'libx11' 'libxi' 'glibc' 'xlibre-xserver')
makedepends=('xlibre-xserver-devel' 'X-ABI-XINPUT_VERSION=26.0' 'xorgproto')
provides=('xf86-input-synaptics')
conflicts=('xf86-input-synaptics' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')
provides+=('synaptics')
conflicts+=('synaptics')
replaces=('synaptics')
groups=('xlibre-drivers')
install=xlibre-input-synaptics.install
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
sha512sums=('e725e7dd76cdae9ceabbd8b3fffab9d55fb5134dddfda30bb305233a844c150f7fca16972082475c336875c43cb4ccb99439583b616539332f954070a2425a3b')

build() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
