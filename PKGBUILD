# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-qsnctf
_name=${pkgname#python-}
pkgver=0.0.12
pkgrel=1
epoch=
pkgdesc="青少年 CTF 训练平台提供的 Python 软件包"
arch=('any')
url="https://github.com/Moxin1044/qsnctf-python"
license=('MIT')
groups=()
depends=(
    python
    python-exejs
    python-base58
    python-requests
    python-beautifulsoup4
    python-sympy
    python-rarfile
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-wheel
)
checkdepends=()
optdepends=()
provides=(${pkgname} qsnctf qsnctf-python)
conflicts=(${pkgname} qsnctf qsnctf-python)
replaces=()
backup=()
options=()
install=
changelog=
source=("${_name}::git+${url}.git#tag=v$pkgver")
noextract=()
sha256sums=('8e770f9909075781839901822e2d830ffbbc400b69e80001edbde121785b9235')
#validpgpkeys=()

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
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -rv docs "${pkgdir}/usr/share/doc/${pkgname}/"
}
