# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="harlequin"
pkgver=2.5.0
pkgrel=1
pkgdesc="The SQL IDE for Your Terminal"
url="https://harlequin.sh/"
license=("MIT")
arch=("any")
depends=("python"
         "python-textual"
         "python-textual-fastdatatable"
         "python-textual-textarea"
         "python-click"
         "python-rich-click"
         "python-duckdb"
         "python-shandy-sqlfmt"
         "python-platformdirs"
         "python-pyperclip"
         "python-importlib-metadata"
         "python-tomli"
         "python-tomlkit"
         "python-questionary"
         "python-black"
         "python-ruff"
         "mypy")
optdepends=('harlequin-mysql: MySQL support'
            'harlequin-postgres: Postgres support'
            'harlequin-odbc: ODBC support')

options=("!strip")

source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "fix-warnings.patch")
b2sums=('c18bbb3a4bfcd14b5fef12696212660c0f55797c6facb32efe81b4e8f815406baba8ae7144e75b95ad39be43df4956d1682bd72d511ceca8d6699439572c57bc'
        '74ca51c3958da81afc68ca1cdec196337d14886d87bfdc4ad74f0b9f321f73325c009d1a2ae22383e851c09707b3d3ebf3c58fb10185c1623881118410ee5a0a')

build() {
    cd "${pkgname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    cd "${pkgdir}"

    patch -p1 < ../../fix-warnings.patch
}
