# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>
# Contributor: Jimmy Stelzer <jimmy.stelzer@gmail.com>
# Contributor: Daniel Maslowski <info@orangecms.org>

pkgname=python-mbed-cli
pkgver=1.10.4
pkgrel=2
pkgdesc="ARM mbed Command Line Interface"
arch=('any')
url="https://os.mbed.com/"
license=('Apache')
optdepends=("mbed-os: for sharing Mbed OS source code among projects/users")
makedepends=('python-setuptools')
checkdepends=('python-pytest')
depends=('python' 'python-pyserial' 'python-mbed-os-tools' 'git' 'mercurial')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ARMmbed/mbed-cli/archive/${pkgver}.tar.gz")
sha256sums=('3ecae62f31ed2b53e0b105b80634acc356ca1b4fccea08e13d0132a6e7ba7eff')

check() {
  cd "mbed-cli-${pkgver}"
  pytest test
}

package() {
  cd "mbed-cli-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 0644 tools/bash_completion/mbed "${pkgdir}/etc/bash_completion.d/mbed-cli.sh"
}

# vim:set ts=2 sw=2 et:
