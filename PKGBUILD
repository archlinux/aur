pkgname=python-misoc-git
_pkgname=misoc
provides=('python-misoc')
# Maintainer: Patschke
# the last tagged release (0.12) is 5 years old at the time of creating this PKGBUILD, so I prefer to build from main (last commit 4 month ago)
pkgver=0.12.r192.ga53859f
pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc='High performance and small footprint SoC based on Migen'
arch=('any')
url='https://github.com/m-labs/misoc'
license=('BSD')
depends=('python' 'python-setuptools' 'python-numpy' 'python-scipy' 'python-pyserial' 'python-asyncserial' 'python-jinja' 'python-migen')
source=("git+https://github.com/m-labs/$_pkgname.git")
sha256sums=('SKIP')

build() {
  cd "$_pkgname"

  python setup.py build
}

package() {
  cd "$_pkgname"

  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build
}
