# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-textual-textarea"
_pkgname="${pkgname/python-/}"
pkgver=0.19.0
pkgrel=2
pkgdesc="A text area (multi-line input) with syntax highlighting for Textual"

url="https://pypi.org/project/textual-textarea/"
license=("MIT")
arch=("any")

makedepends=("python-build" "python-installer" "python-hatchling" "python-wheel")
depends=("python" "python-rich" "python-textual" "python-pyperclip" "python-tree-sitter")

options=("!strip")

source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname/-/_}-${pkgver}.tar.gz")
b2sums=('ee168a62564676a06d831196ae394c6afc551ce91d6df4c976180d8cbd6ce26780837283c634f4f7e895a31439f55fcd42dd900d9133d070466eda239b5f4d24')

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
