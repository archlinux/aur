# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-darabonba-core
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.0.11
pkgrel=1
epoch=
pkgdesc="The darabonba module of alibabaCloud Python SDK."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(Apache-2.0)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
_pydeps=(
    aiohttp
    certifi
    requests
    websocket-client
# AUR
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
sha256sums=('8ffd2577ebd85415c0f62ae695da7787c13daf8038588b519e95e782ce259183')

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
