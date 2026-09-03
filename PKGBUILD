# Maintainer: David Hrabě <david.hrabe12@seznam.cz>
pkgname=python-aws-sso-lib
_pyname=aws-sso-lib
pkgver=1.14.0 # renovate: datasource=pypi depName=aws-sso-lib
pkgrel=1
pkgdesc="Library for programmatic interaction with AWS IAM Identity Center"
arch=('any')
url="https://github.com/61418/aws-sso-util"
license=('Apache-2.0')
depends=(
    'python'
    'python-aws-error-utils'
    'python-boto3'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-poetry-core'
    'python-wheel'
)
source=(
    "https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname//-/_}-${pkgver}.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/61418/aws-sso-util/lib-v${pkgver%.*}/LICENSE"
)
sha256sums=(
    'b0203a64ccb66ba78f99ef3d0eb669affe7bc323f6ab9caac97f35c21a03cea5'
    'f63f11a8ef1b3c5aa7e1ab83a16a5e82cb0c1414a5af0e761284403b83c9c8e0'
)

build() {
    cd "${srcdir}/${_pyname//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pyname//-/_}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}