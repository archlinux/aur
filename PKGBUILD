# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-alibabacloud-esa20240910
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=3.11.0
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
sha256sums=('fba95f60b61aa5b0733d9cd9c45e997ca996433c40d0bdb24123a7956aa7031b')

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
