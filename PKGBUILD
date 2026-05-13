# Maintainer: Frestein <fresteinart@gmail.com>

pkgname=tclint-git
pkgver=0.8.0.r6.g04b377d
pkgrel=1
pkgdesc="A collection of Tcl CLI tools: linter, formatter, language server"
arch=('any')
url="https://github.com/nmoroze/tclint"
license=('MIT')
depends=('python>=3.10' 'python-ply' 'python-pathspec' 'python-importlib-metadata' 'python-pygls' 'python-voluptuous')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-setuptools-scm' 'git')
provides=('tclint')
conflicts=('tclint')
source=("${pkgname}-${pkgver}::git+https://github.com/nmoroze/tclint.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}-${pkgver}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
