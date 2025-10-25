# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=trayer
pkgver=1.1.8
pkgrel=5
pkgdesc='lightweight GTK2-based systray for UNIX desktop'
url='https://github.com/sargon/trayer-srg'
arch=('x86_64')
license=('MIT')
depends=('gtk2')
makedepends=('libxmu')
provides=('trayer-srg')
conflicts=('trayer-srg')
source=(
  ${pkgname}-${pkgver}.tar.gz::https://github.com/sargon/trayer-srg/archive/trayer-${pkgver}.tar.gz
  trayer-srg-trayer-1.1.8-bg_init_prototype.patch
)
sha512sums=('5ae92fdcee64ad1ca59846874dcd4bd4859adeeb80a86f1ed97d62e6306f8ec62d1ee26dba251257242dc25d158a6a550e69f2fcc8739242a2311e37fe1ce310'
            '432e2629f0077dfcbac57ffccaafa1644d135adece8ba4317eef7fa6e3a9316ccce120b2eedc6ae01fe35d9db0e395c19ef9d33332f184907a9b435e43aa8853')

prepare() {
  # see https://github.com/sargon/trayer-srg/issues/70
  # also void instead of empty parameter list
  cd trayer-srg-${pkgname}-${pkgver}
  patch -Np1 < ../trayer-srg-trayer-1.1.8-bg_init_prototype.patch
}

build() {
  cd trayer-srg-${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd trayer-srg-${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 man/trayer.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
