# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=portmod
pkgver=2.5.8
pkgrel=1
pkgdesc="A cli tool to manage mods for OpenMW"
provides=('portmod')
conflicts=('portmod')
replaces=('openmmm')
arch=(any)
url="https://gitlab.com/portmod/portmod"
license=(GPL3)
depends=("python" "patool" "python-setuptools" "python-colorama" "python-gitpython"
         "python-progressbar" "python-restrictedpython" "bubblewrap" "python-redbaron"
         "python-python-sat" "python-requests" "python-chardet" "python-fasteners")
makedepends=("python" "python-setuptools" "python-setuptools-scm" "rust" "python-setuptools-rust" "python-packaging" "python-sphinx" "python-sphinx-argparse" "make")
checkdepends=("python-pytest")
optdepends=("tr-patcher" "python-argcomplete")
source=("https://gitlab.com/portmod/portmod/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('32814da60aeaf684ce089d37e4de65f6ad73eafce33c493302fda8496ae94f7bc6b4847e130b212e98063a6f2477e4b195ac6bec12a7f0312c406805ec3ee9bf')

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py build_rust --inplace --release
  make -C doc man
}

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver pytest
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir --optimize=1
}
