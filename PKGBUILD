# Maintainer: Davide Depau <davide@depau.eu>

_pkgname='python-fastecdsa'
pkgname="${_pkgname}-git"
pkgver=2.1.2.r1.g4a16dae
pkgrel=2
pkgdesc='Python library for fast elliptic curve crypto'
arch=('x86_64')  # Please let me know if it works on other archs
url='https://github.com/AntonKueltz/fastecdsa'
license=('custom:Unlicense')
depends=('python' 'gmp')
makedepends=('python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/AntonKueltz/fastecdsa.git") 
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	python setup.py build
}

package() {
	cd "$_pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

