# Maintainer:  Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-btchip-git
pkgver=0.1.32
pkgrel=4
pkgdesc="Python library to communicate with BTChip dongle"
arch=('any')
depends=('python-hidapi' 'libusb-compat' 'libusb' 'libsystemd')
makedepends=('python-setuptools')
optdepends=('btchip-udev: access BTChip as non-root user')
url="https://github.com/LedgerHQ/btchip-python"
license=('Apache')
provides=('python-btchip-git' 'python-btchip')
conflicts=('python-btchip-git' 'python-btchip')
source=(git+https://github.com/LedgerHQ/btchip-python)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/btchip-python/"
    git tag -l | sed 's/v//g' | sort | tail -n 1
}

build() {
  cd "$srcdir/btchip-python/"
  git checkout $(git tag -l | sed 's/v//g' | sort | tail -n 1) > /dev/null 2>&1
  python setup.py build
}

package() {
  cd "$srcdir/btchip-python/"
  python setup.py install --root="$pkgdir" --optimize=1
}
