# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=portmod
pkgver=2.0_rc5
pkgrel=1
pkgdesc="A cli tool to manage mods for OpenMW"
provides=('portmod')
conflicts=('portmod')
replaces=('openmmm')
arch=(any)
url="https://gitlab.com/portmod/portmod"
license=(GPL3)
depends=("python" "patool" "python-setuptools" "python-colorama" "python-appdirs" "python-gitpython"
         "python-progressbar" "python-restrictedpython" "bubblewrap" "python-redbaron"
         "python-python-sat" "python-requests" "python-chardet" "python-fasteners-git")
makedepends=("python" "python-setuptools" "python-setuptools-scm" "rust" "python-setuptools-rust" "python-packaging")
checkdepends=("python-pytest")
optdepends=("omwllf" "tes3cmd" "tr-patcher" "python-argcomplete")
source=("https://gitlab.com/portmod/portmod/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('546204af1a58773ad583ee1a62883ce4b0b3bf9e28938f7510404c2a82b5c65f2f33204f82b752c49b070ec58c19a8ea5f498bb31119ca365104506fff288079')

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py build_rust --inplace --release
}

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver pytest
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir
}
