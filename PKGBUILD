# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('python-cryptoparser-git' 'python2-cryptoparser-git')
pkgver=0.7.3.r0.g4c34996
pkgrel=1
pkgdesc='Cryptographic protocol parser'
arch=('any')
url='https://gitlab.com/coroner/cryptoparser'
license=('MPL2')
makedepends=('python-setuptools' 'python2-setuptools' 'git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  git clone "$pkgname" "${pkgname/python/python2}"
}

package_python2-cryptoparser-git() {
  depends=('python2-asn1crypto' 'python2-attrs' 'python2-dateutil' 'python2-six')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgname"
  PYTHONHASHSEED=0 python2 setup.py install --root="$pkgdir/" --optimize=1
}

package_python-cryptoparser-git() {
  depends=('python-asn1crypto' 'python-attrs' 'python-dateutil' 'python-six')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgname"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
