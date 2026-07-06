# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xlibre-input-elographics
_pkgname=xf86-input-elographics
pkgver=25.0.1
pkgrel=3
pkgdesc="XLibre Elographics TouchScreen input driver"
arch=(x86_64)
license=('MIT')
url='https://github.com/X11Libre/xf86-input-elographics'
depends=('glibc' 'xlibre-xserver')
makedepends=('xlibre-xserver-devel' 'X-ABI-XINPUT_VERSION=26.0' 'xorgproto')
provides=('xf86-input-elographics')
conflicts=('xf86-input-elographics' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')
groups=('xlibre-drivers')
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
sha512sums=('450e813e0adc257f5a032d333055284c8505bf0e0493a10afba289ee7929c07cd7e319383ff6e2923ce00fa81c14a4f99f157ff2b75fbcf9e84e8ca91dae3b64')

build() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm 644 COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
