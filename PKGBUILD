# Maintainer: Davide Depau <davide@depau.eu>

_pkgname='tcconfig'
pkgname="${_pkgname}-git"
pkgver=v0.26.0.r10.gb5b24ab
pkgrel=1
pkgdesc='A simple tc command wrapper'
arch=('any')
url='https://github.com/thombashi/tcconfig'
license=('MIT')
depends=(
  'iproute2'
  'python-pygments'
  'python-dataproperty'
  'python-docker'
  'python-humanreadable'
  'python-loguru'
  'python-msgfy'
  'python-path'
  'python-pyparsing'
  'python-pyroute2'
  'python-simplesqlite'
  'python-subprocrunner'
  'python-typepy'
  'python-voluptuous'
)
makedepends=('python-setuptools')
optdepends=('docker: Docker container queue discipline support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "$_pkgname::git+https://github.com/thombashi/tcconfig.git"
)
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	python setup.py build
}

package() {
	cd "$_pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

