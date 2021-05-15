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
sha256sums=('c3032f38a07b54772299ce8832e16109a685ee63eeefbb17cef9fe1dd100a448'
            'a14b613039dc0003d644e590a0beae6bc92cafe0ccdf14df1d200c7910a55e11')

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
