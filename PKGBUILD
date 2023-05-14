# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-msldap
_pkgname=msldap
pkgver=0.4.7
pkgrel=1
pkgdesc="Python library to play with MS LDAP"
url="https://pypi.org/project/msldap/"
arch=('any')
license=('MIT')
depends=('python' 'python-asn1crypto' 'python-winsspi' 'python-minikerberos' 'python-asysocks' 'python-tqdm' 'python-winacl' 'python-prompt_toolkit')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('58c32a3524430703d0ff500282db92bc0e748fec4dca39f197bad36f1dee435c')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
