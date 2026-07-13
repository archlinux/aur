# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-alibabacloud-credentials-api
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="Alibaba Cloud Gateway SPI SDK Library for Python"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(Apache-2.0)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
_pydeps=(
# AUR
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('8ea0668a6558f6956b8d20b2e561d19a80ea29c22cf56a3004d434b24a981b36')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    # install -Dm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    # install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
