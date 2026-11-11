# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-alibabacloud-esa20240910
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=3.17.1
pkgrel=1
epoch=
pkgdesc="Alibaba Cloud ESA (20240910) SDK Library for Python"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(Apache-2.0)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(
    python
    #AUR
    python-alibabacloud-tea-openapi
    python-darabonba-core
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('554ab28300310c8e19ec3fa6922081a96008e237c88ab1ac878cbde8f5f8bc9f')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
