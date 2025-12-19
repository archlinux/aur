# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="harlequin"
pkgver=2.5.1
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
b2sums=('41661d02bf27f770510b5dacd58b4b481d52a4afed9adf6ee03134990e48d88b904b47ec730588b22aa45c17034bd6ca22fa79a4ee868c5426bba3751c4d65d3'
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
