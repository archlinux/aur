# Maintainer: NebulaNeko <chfsefefgesfen foxmail>
# Contributor: Wijnand Modderman-Lenstra <maze@pyth0n.org>
# Contributor: Drew DeVault <sir@cmpwn.com>
# Contributor: Bruce Zhang <zttt183525594@gmail.com>

pkgname='python2-pycrypto'
_pkgname='pycrypto'
pkgver=2.7a1
pkgrel=1
pkgdesc='Cryptographic primitives and algorithms for Python'
arch=('x86_64')
url='https://pypi.python.org/pypi/pycrypto'
license=('custom:Public domain')
depends=('python2-flask' 'gmp')
makedepends=('python2-setuptools')
provides=('python2-pycryptodome' 'python2-crypto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dlitz/pycrypto/archive/v$pkgver.tar.gz")
sha512sums=('4b6ba9f6c0226ea9c3abc08ebf8331a65da39e8f84cbb643302ef337faf46b4de4b3b3ab6358796cef3da271f81d14f7ad0e3b9353d7c913351674efb21a71d6')

prepare() {
  # python -> python2 rename
  find $_pkgname-$pkgver -type f -name '*py' -exec sed -e 's_#! \?/usr/bin/env python_&2_' -i {} \;
}

build() {
	cd "$_pkgname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
