# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-alibabacloud-tea-openapi 
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.4.3
pkgrel=1
epoch=
pkgdesc="Alibaba Cloud openapi SDK Library for Python"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(Apache-2.0)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
_pydeps=(
    cryptography
# AUR
    alibabacloud-credentials
    alibabacloud-gateway-spi
    alibabacloud-tea
    darabonba-core
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
sha256sums=('12aef036ed993637b6f141abbd1de9d6199d5516f4a901588bb65d6a3768d41b')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    # install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
