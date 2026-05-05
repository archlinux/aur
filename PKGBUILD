# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-matplotlib-pgfutils
pkgdesc="Utilities for generating PGF figures from Matplotlib"
pkgver=2.0.1
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
  '693911ba651bdf491a9dd8be69ec553f46cf022d113de6b2a24d9b3a3b1f451e'
)

build() {
  cd matplotlib-pgfutils
  python -m build --no-isolation --wheel
}

check() {
  cd matplotlib-pgfutils
  pytest
}

package() {
  cd matplotlib-pgfutils
  python -m installer --destdir="$pkgdir" "dist/matplotlib_pgfutils-$pkgver"-*.whl
  install -Dm644 LICENSES/BSD-3-Clause.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
