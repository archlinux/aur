# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>
# Contributor: Jimmy Stelzer <jimmy.stelzer@gmail.com>
# Contributor: Daniel Maslowski <info@orangecms.org>

pkgbase=python-mbed-cli
pkgname=('python-mbed-cli' 'python2-mbed-cli')
pkgver=1.10.3
pkgrel=2
pkgdesc="ARM mbed Command Line Interface"
arch=('any')
url="https://os.mbed.org"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ARMmbed/mbed-cli/archive/${pkgver}.tar.gz")
sha256sums=('8a95093a89aa8fb7a911775155cdb4b9d124ef6af74393dfc1b0bb79c3e33327')

check_python-mbed-cli() {
  checkdepends=('python-pytest')

  cd "mbed-cli-${pkgver}"
  pytest test
}

package_python-mbed-cli() {
  depends=(
    'python'
    'python-pyserial'
    'python-mbed-os-tools'
    'git'
    'mercurial'
  )

  cd "mbed-cli-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 0644 tools/bash_completion/mbed "${pkgdir}/etc/bash_completion.d/mbed-cli.sh"
}

check_python2-mbed-cli() {
  checkdepends=('python-pytest')

  cd "mbed-cli-${pkgver}"
  pytest2 test
}

package_python2-mbed-cli() {
  depends=(
    'python'
    'python-pyserial'
    'python-mbed-os-tools'
    'git'
    'mercurial'
  )

  cd "mbed-cli-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 0644 tools/bash_completion/mbed "${pkgdir}/etc/bash_completion.d/mbed-cli.sh"
}

# vim:set ts=2 sw=2 et:
