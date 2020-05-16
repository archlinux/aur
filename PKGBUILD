# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname='python-aenum'
_pkgname='aenum'
pkgver=2.2.2
pkgrel=3
pkgdesc="Advanced Enumerations (compatible with Python's stdlib Enum), NamedTuples, and NamedConstants"
arch=('any')
url="https://bitbucket.org/stoneleaf/aenum"
license=('BSD')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/00/db/6f60b39f91981b8b2811da5cb9fe989ae1ed2a424ae937f1a731ad4be945/aenum-2.2.2.tar.gz")
sha256sums=('c94fde69eebf8d478d68f0d96c61178299d9a19465ef5effa326ebee7536c203')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  depends=("python")
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # XXX: I have no idea what's wrong with the setup.py. This is a quickfix!
  install -Dm644 aenum/__init__.py "${pkgdir}/usr/lib/python3.8/site-packages/${_pkgname}/__init__.py"
  install -Dm644 aenum/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

