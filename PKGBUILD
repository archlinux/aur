# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=portmod
pkgver=2.7.3
pkgrel=1
pkgdesc="A cli tool to manage mods for OpenMW"
replaces=('openmmm')
arch=(any)
url="https://gitlab.com/portmod/portmod"
license=(GPL3)
depends=("python" "patool" "python-setuptools" "python-colorama" "python-gitpython"
         "python-progressbar" "python-restrictedpython" "bubblewrap" "python-redbaron"
         "python-python-sat" "python-requests" "python-chardet" "python-fasteners")
makedepends=("python" "python-setuptools" "python-setuptools-scm" "rust" "python-setuptools-rust" "python-packaging" "python-sphinx" "python-sphinx-argparse" "make" "python-autodocsumm" "python-sphinx-autodoc-typehints" "python-sphinxcontrib-apidoc")
checkdepends=("python-pytest")
optdepends=("tr-patcher" "python-argcomplete" "python-deprecated")
source=("https://gitlab.com/portmod/portmod/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('48fcd7b0d3ee690651b34f479c56457d5da70cbeec08fd23e493a214ef702846c0a716c6f55b929f66c6e05f292d8d20f0696977ac427afc9e3c71eb08f9007f')

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py build_rust --inplace --release
  make -C doc man
}

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  # Disable for now, some tests will fail without a network connection
  # SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver pytest
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir --optimize=1
}
