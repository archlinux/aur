# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-aiosmb
_pkgname=aiosmb
pkgver=0.4.4
pkgrel=2
pkgdesc="Fully asynchronous SMB library written in pure python."
url="https://github.com/skelsec/aiosmb"
arch=('any')
license=('MIT')
depends=('python' 'python-minikerberos' 'python-winsspi' 'python-asysocks'
	 'python-prompt_toolkit' 'python-winacl' 'python-six' 'python-tqdm'
	 'python-colorama')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('20620498cf5e6794fea29ddcb46afbda8cbf714e3cf8e1da149699f03453637f')

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
