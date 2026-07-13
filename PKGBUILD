# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-alibabacloud-credentials
_name=${pkgname#python-}
pkgver=1.0.9
pkgrel=1
pkgdesc="The alibabacloud credentials module of alibabaCloud Python SDK."
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/aliyun/credentials-python"
_pydeps=(
    aiofiles
    requests
# AUR
    apscheduler
    alibabacloud-tea
    alibabacloud-credentials-api
)
depends=(
    'python'
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=()
license=('Apache-2.0')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('f3a786bb7459580e254ca299406112eb1e18b9925fae291aa57b73d09cb01d04')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    # install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
