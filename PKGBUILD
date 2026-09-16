# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-textual-textarea"
_pkgname="${pkgname/python-/}"
pkgver=0.18.4
pkgrel=1
pkgdesc="A text area (multi-line input) with syntax highlighting for Textual"

url="https://pypi.org/project/textual-textarea/"
license=("MIT")
arch=("any")

makedepends=("python-build" "python-installer" "python-poetry" "python-wheel")
depends=("python" "python-rich" "python-textual" "python-pyperclip" "python-tree-sitter")

options=("!strip")

source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname/-/_}-${pkgver}.tar.gz")
b2sums=('af7fe8af769d95c998e7aecc02417d5ab0104855d2a71012f4331e3567efe93fb36ae9748fd91fc92d6d4e6d3df8689f86e14b7294eed251216f451fd795f013')

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
