# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-textual-textarea"
_pkgname="${pkgname/python-/}"
pkgver=0.18.3
pkgrel=1
pkgdesc="A text area (multi-line input) with syntax highlighting for Textual"

url="https://pypi.org/project/textual-textarea/"
license=("MIT")
arch=("any")

makedepends=("python-build" "python-installer" "python-poetry" "python-wheel")
depends=("python" "python-rich" "python-textual" "python-pyperclip" "python-tree-sitter")

options=("!strip")

source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname/-/_}-${pkgver}.tar.gz")
b2sums=('be6b75eccf0dd977244d435d1644c19a93a78c03fbb352aff1ab18c16d331829a0797e7f06cee4ce8aec1f6affea4114be1606c49bcc9f0edba921eb5884cd1e')

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
