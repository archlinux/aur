# Maintainer: robertfoster

pkgname=python2-pynacl-git
pkgver=1.4.0.r31.f6c17a3
pkgrel=1
pkgdesc='Python binding to the Networking and Cryptography (NaCl) library'
arch=('any')
url='http://libnacl.readthedocs.org'
license=('APACHE')
depends=('libsodium' 'python2' 'python2-cffi')
makedepends=('python2-setuptools' 'python2-pycparser')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/pyca/pynacl.git")

build() {
  export SODIUM_INSTALL=system

  cd "${srcdir}/${pkgname}"
  python2 setup.py build
}

package() {
  export SODIUM_INSTALL=system

  cd "${srcdir}/${pkgname}"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

md5sums=('SKIP')
