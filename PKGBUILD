# Maintainer: Denis Alevi <mail at denisalevi dot de>

pkgname=python-httpsig
_name=${pkgname#python-}
pkgver=1.3.0
pkgrel=3
pkgdesc='Secure HTTP request signing using the HTTP Signature draft specification'
url='https://github.com/ahknight/httpsig'
arch=('any')
license=('MIT')
depends=('python-pycryptodome')
optdepends=('python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('71d6d50246129c4f7cfec20f5e57e351d2b8492d631cc2aa967914acf91f6ce6')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --optimize=1 --root="${pkgdir}" --skip-build
  install -D -m 644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py test
}

# vim:set sw=2 sts=2 et:
