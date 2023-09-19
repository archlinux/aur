# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=portmod
pkgver=2.7.0
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
sha512sums=('e4a57e0b9b8380e4c775e434b0bef6df3eb7816e6e3c2c3b60cdbb8f42149e728a888c7c1d00415dec29471afcba2b9e2f68a46d965f8d73c0d4812a17600478')

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
