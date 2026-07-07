# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pwnv
_name=${pkgname#python-}
pkgver=0.4.5
pkgrel=1
pkgdesc="CLI tool for CTF management"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/CarixoHD/pwnv"
_pydeps=(
    dotenv
    filelock
    inquirer
    inquirerpy
    pydantic
    rich
    typer
# AUR
    ctfbridge
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
    'python-setuptools-scm'
    'python-wheel'
)
optdepends=(
    'python-ctf-dl: A CTF challenge bulk downloader'
    'python-ctf-sniper: An automated flag submission tool'
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('6026f4f0971ef051bc61b7a43863db68410197795b20842b3ee1b0d533c5439d')

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
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
