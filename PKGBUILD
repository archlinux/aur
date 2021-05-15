# Maintainer:
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-input-acecad
pkgver=1.5.0
pkgrel=10
pkgdesc="X.Org acecad tablet input driver"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/wiki/"
license=('custom')
depends=(sysfsutils)
makedepends=(xorgproto xorg-server-devel xorg-server 'X-ABI-XINPUT_VERSION=24.1')
conflicts=('X-ABI-XINPUT_VERSION<24.1' 'X-ABI-XINPUT_VERSION>=25')
source=("https://xorg.freedesktop.org/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2"
        assign-local-private-after-allocating.patch)
sha1sums=('410cee68e4435dc95774fb389fcefae1b2ffe3d1'
          '9301020b0ef3c6f2081e957481a88d2e187a7973')

build() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/assign-local-private-after-allocating.patch"
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
