pkgname=logv
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast CLI/TUI log viewer for Linux terminals"
arch=('any')
url="https://github.com/Ribengame/logv"
license=('MIT')
depends=('python' 'python-rich' 'python-textual' 'python-typer')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ec03f625269ae7a0acb0795ef144156587f4efe05c843cba7f2d3aa48fea9806')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m unittest discover -s tests -v
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
