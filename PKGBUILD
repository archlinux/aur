# Maintainer: Davide Depau <davide@depau.eu>

_pkgname='python-fastecdsa'
pkgname="${_pkgname}-1.7.4"
pkgver=1.7.4.r0.g5fa0163
pkgrel=1
pkgdesc='Python library for fast elliptic curve crypto (v1.7.4)'
arch=('x86_64')  # Please let me know if it works on other archs
url='https://github.com/AntonKueltz/fastecdsa'
license=('custom:Unlicense')
depends=('python' 'gmp')
makedepends=('python-setuptools')
provides=("$_pkgname=1.7.4")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/AntonKueltz/fastecdsa.git#tag=v1.7.4") 
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

