# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-matplotlib-pgfutils
pkgdesc="Utilities for generating PGF figures from Matplotlib"
pkgver=2.0.0
pkgrel=1
url="https://matplotlib-pgfutils.readthedocs.io/"
license=('BSD-3-Clause')
arch=('any')

depends=(
  'python-matplotlib'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
)
checkdepends=(
  'python-pytest'
  'python-pytest-cov'
  'texlive-fontsrecommended'
  'texlive-latexrecommended'
  'texlive-pictures'
  'texlive-xetex'
)

source=(
  "git+https://github.com/bcbnz/matplotlib-pgfutils.git#tag=v${pkgver}"
)
sha256sums=(
  'db1339571834503009fed08d8ba1f1f7008867dd12f46ad0fc27ba86f79b99aa'
)

build() {
  cd matplotlib-pgfutils
  python -m build --no-isolation --wheel
}

check() {
  cd matplotlib-pgfutils
  pytest -x
}

package() {
  cd matplotlib-pgfutils
  python -m installer --destdir="$pkgdir" "dist/matplotlib_pgfutils-$pkgver"-*.whl
  install -Dm644 LICENSES/BSD-3-Clause.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
