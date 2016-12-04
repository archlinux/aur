# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Robert Buhren <robert@robertbuhren.de>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: xav <xav at ethertricks dot net>
# Contributor: julian <pidanc_j at epita dot fr>
# Contributor: Silvio Knizek <killermoehre@gmx.net>

pkgname=trousers
pkgver=0.3.14
pkgrel=2
pkgdesc="Open-source TCG Software Stack implementation for use with a TPM"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/trousers"
license=('CPL')
depends=('openssl')
options=('libtool')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz
        ${pkgname}.install
        tcsd.service
        70-tpmd.rules)
sha256sums=('ce50713a261d14b735ec9ccd97609f0ad5ce69540af560e8c3ce9eb5f2d28f47'
            '18a96f4067968d947d5c4d4572b360de19cc940e082e221768add82a24539b9e'
            '653c3a94ec628e7a7fb150d0d289b0866c6b3bb9aa57af2c59724517d205d7bd'
            'c50ea41a4809699dd50f2e621acc6baafb2dffa43cd5a0df8a0679f1d1b1b884')

build() {
  # the tarball for 0.3.14 doesn't have a parent directory
  cd ${srcdir}/
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libdir=/usr/lib \
              --sbindir=/usr/bin \
              --with-openssl=/usr \
              --with-gui=openssl
  make
}

package() {
  # the tarball for 0.3.14 doesn't have a parent directory
  cd ${srcdir}/
  make DESTDIR=${pkgdir} install
  install -Dm644 ${srcdir}/tcsd.service ${pkgdir}/usr/lib/systemd/system/tcsd.service
  install -Dm644 ${srcdir}/70-tpmd.rules ${pkgdir}/usr/lib/udev/rules.d/70-tpmd.rules
}

# vim:set ts=2 sw=2 et:
