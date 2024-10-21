# Maintainer: arielzn <arielzn at riseup dot net>

pkgname="mkdocs-table-reader-plugin"
_pypisrc=${pkgname//-/_}
pkgver=3.1.0
pkgrel=1
pkgdesc="MkDocs plugin to directly insert tables from files into markdown."
url="https://github.com/timvink/mkdocs-table-reader-plugin"
license=("MIT")
arch=("any")
provides=("mkdocs-table-reader-plugin")
conflicts=("mkdocs-table-reader-plugin-git")
depends=("mkdocs>=1.0" "python-pandas>=1.1" "python-tabulate>=0.8.7" "python-yaml>=5.4.1")
makedepends=("python-build" "python-installer")
source=("https://files.pythonhosted.org/packages/source/${_pypisrc::1}/${_pypisrc}/${_pypisrc}-$pkgver.tar.gz")
sha256sums=("eb15688ee8c0cd1a842f506f18973b87be22bd7baa5e2e551089de6b7f9ec25b")

build(){
    cd "${srcdir}/${_pypisrc}-${pkgver}"
    python -m build --wheel --no-isolation
}

package(){
    cd "${srcdir}/${_pypisrc}-${pkgver}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
