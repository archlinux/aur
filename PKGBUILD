# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-textual-textarea"
_pkgname="${pkgname/python-/}"
pkgver=0.18.2
pkgrel=1
pkgdesc="A text area (multi-line input) with syntax highlighting for Textual"

url="https://pypi.org/project/textual-textarea/"
license=("MIT")
arch=("any")

makedepends=("python-build" "python-installer" "python-poetry" "python-wheel")
depends=("python" "python-rich" "python-textual" "python-pyperclip" "python-tree-sitter")

options=("!strip")

source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname/-/_}-${pkgver}.tar.gz")
b2sums=('171475c0c637d823c2d68f0c19aefe5fdf1c143a077a820757584ff5d3e43f1b5565162f2cfc1ad3d15410cc4377e733d591b69b0ebcc3b119e288b61617725c')

build(){
    cd "${_pkgname/-/_}-${pkgver}"

    python -m build --wheel --no-isolation
}

package(){
    cd "${_pkgname/-/_}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
