# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-alibabacloud-credentials
_name=${pkgname#python-}
pkgver=1.0.8
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
sha256sums=('db4d7b915019c89b6e20083322d62edae06f4dcb182ccec60679d26d3de48ad5')

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
