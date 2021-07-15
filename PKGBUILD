# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=python-txtorcon
pkgver=20.0.0
pkgrel=3
pkgdesc='A Twisted-based Python asynchronous controller library for Tor'
arch=('any')
url='https://txtorcon.readthedocs.org/'
license=('MIT')
depends=('python-automat' 'python-twisted')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-cryptography' 'python-pyopenssl' 'lsof')
source=("${pkgname#python-}-${pkgver}.tar.gz::https://github.com/meejah/txtorcon/releases/download/v${pkgver}/txtorcon-${pkgver}.tar.gz"
        "${pkgname#python-}-${pkgver}.tar.gz.asc::https://github.com/meejah/txtorcon/releases/download/v${pkgver}/txtorcon-${pkgver}.tar.gz.asc")
sha512sums=('4856c86b3eac432b8e2dddec4d4ef3172452d084a5685f90335d366e918e2e80a223a7a31ff78ddb6dff1ddbbfc1e26f6d0ae9fb99bd47d6894cc6dd29365da8'
            'SKIP')
validpgpkeys=('9D5A2BD5688ECB889DEBCD3FC2602803128069A7')

build() {
  cd "${pkgname#python-}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname#python-}-${pkgver}"
  PYTHONPATH=. trial test
}

package() {
  cd "${pkgname#python-}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  rm -r "${pkgdir}/usr/share/txtorcon"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
