# Maintainer: David Hrabě <david.hrabe12@seznam.cz>
pkgname=python-aws-error-utils
_pyname=aws-error-utils
pkgver=2.7.0 # renovate: datasource=pypi depName=aws-error-utils
pkgrel=1
pkgdesc="Error-handling functions for boto3 and botocore"
arch=('any')
url="https://github.com/benkehoe/aws-error-utils"
license=('Apache-2.0')
depends=(
    'python'
    'python-botocore'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-poetry-core'
    'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname//-/_}-${pkgver}.tar.gz")
sha256sums=('07107af2a2c26706cd9525b7ffbed43f2d07b50d27e39f9e9156c11b2e993c97')

build() {
    cd "${srcdir}/${_pyname//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pyname//-/_}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}