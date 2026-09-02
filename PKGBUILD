# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pwnv
_name=${pkgname#python-}
pkgver=0.6.0
pkgrel=3
pkgdesc="CLI tool for CTF management"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/CarixoHD/pwnv"
_pydeps=(
    click
    dotenv
    filelock
    inquirerpy
    prompt_toolkit
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
sha256sums=('5922837aca9620043a26a023d5c742b8dc016b8ae0866fce6431c1836b4cc61b')

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
