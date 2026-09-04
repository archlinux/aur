# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-qsnctf
_name=${pkgname#python-}
pkgver=0.0.10
pkgrel=3
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
sha256sums=('42613966b2cf5ae704a7ee75690040543ed85ea1b6fed10e186357e3e4b7d6d2')
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
    # install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -R docs "${pkgdir}/usr/share/doc/${pkgname}/"
}
