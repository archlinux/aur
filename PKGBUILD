# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xlibre-input-void
_pkgname=xf86-input-void
pkgver=25.0.0
pkgrel=8
pkgdesc="XLibre void input driver"
arch=(x86_64)
license=('custom')
url='https://github.com/X11Libre/xf86-input-void'
depends=('glibc' 'xlibre-xserver')
makedepends=('xlibre-xserver-devel' 'X-ABI-XINPUT_VERSION=26.0' 'xorgproto')
provides=('xf86-input-void')
conflicts=('xf86-input-void' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')
groups=('xlibre-drivers')
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
sha512sums=('ee6bff8f0d31a77d9aa2cfb5099eb825c7999d9270c63d5d7612a0ff3a723bbc55576a10496b2355b95c0d35aff95c03008148d367131b8e1ddb159a32ee0d9a')

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
