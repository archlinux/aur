# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-textual-textarea"
_pkgname="${pkgname/python-/}"
pkgver=0.18.5
pkgrel=1
pkgdesc="A text area (multi-line input) with syntax highlighting for Textual"

url="https://pypi.org/project/textual-textarea/"
license=("MIT")
arch=("any")

makedepends=("python-build" "python-installer" "python-poetry" "python-wheel")
depends=("python" "python-rich" "python-textual" "python-pyperclip" "python-tree-sitter")

options=("!strip")

source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname/-/_}-${pkgver}.tar.gz")
b2sums=('7428bcacce78e993c5c1768db80e426f6986c1fe0a3de544682e6805dadaa648a6a480a0597a3d12db31f66fb2b325d7427fbdbf9f138e3f218b9924e7fe17ee')

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
