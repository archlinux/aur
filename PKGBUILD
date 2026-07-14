# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-alibabacloud-tea-openapi 
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.4.5
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
sha256sums=('75fa1f4360a46e41f5bf5f8d4917e52efb6f64885839bc1328c35590670c97b9')

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
