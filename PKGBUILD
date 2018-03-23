# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Arnaud Taffanel <dev@taffanel.org>
# Contributor: Victor Häggqvist <aur a snilius d com>

_name=Solaar
pkgname=solaar
pkgver=0.9.2
pkgrel=9
pkgdesc="Device manager for Logitech's Unifying receiver peripherals"
url="https://pwr.github.com/Solaar/"
license=('GPL2')
arch=('any')
depends=('hicolor-icon-theme' 'python-pyudev' 'python-gobject' 'python-six')
optdepends=('libappindicator3: Integration with Unity')
makedepends=('python-setuptools')
provides=('solaar')
conflicts=('solaar')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pwr/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('13f469df753cc8fab55f5259ccc3e62b6e44471d277d240cd56ce0580144d2b1f95d731268176648663dd15e5607bfb512f477362f4f100aa0a653b001dfe04b')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"

}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}/"
  # udev
  install -vDm 644 rules.d/42-logitech-unify-permissions.rules \
    "${pkgdir}/usr/lib/udev/rules.d/42-logitech-unify-permissions.rules"
  # docs
  install -vDm 644 {ChangeLog,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
# vim:set ts=2 sw=2 et:
