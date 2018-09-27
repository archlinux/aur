# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname=python-opentimestamps-git
pkgver=0.4.0.r0.g881e6d3
pkgrel=1
pkgdesc="Python3 library for working with the OpenTimestamps protocol"
arch=(any)
url="https://github.com/opentimestamps/python-opentimestamps"
license=('LGPL3')
depends=('python-bitcoinlib' 'python-pysha3')
makedepends=('git' 'python-setuptools')
checkdepends=('python-gitpython')
source=(git+https://github.com/opentimestamps/python-opentimestamps)
md5sums=('SKIP')

pkgver() {
  cd ${pkgbase%-git}
  ( set -o pipefail
    git describe --long --tags | sed 's/^python-opentimestamps-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  )
}

build() {
  cd ${pkgbase%-git}
  python setup.py build
}

check() {
  cd ${pkgbase%-git}
  python -m unittest discover -v
}

package() {
  cd ${pkgbase%-git}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
