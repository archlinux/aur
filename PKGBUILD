# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-certbot-dns-aliyun-esa
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc="Aliyun ESA DNS Authenticator plugin for Certbot"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/lampofaladdin/certbot-dns-aliyun-esa"
_pydeps=(
    # AUR
    alibabacloud-tea-openapi
    alibabacloud-esa20240910
)
depends=(
    'certbot'
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
sha256sums=('8b8cde526c33b188807992f32a5f2ed757bf0cfa0b765c5bc0c2dfb425c00bb6')

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
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
