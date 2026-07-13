# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-alibabacloud-gateway-spi
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.0.3
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
    alibabacloud-credentials
    alibabacloud-tea
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
sha256sums=('10d1c53a3fc5f87915fbd6b4985b98338a776e9b44a0263f56643c5048223b8b')

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
