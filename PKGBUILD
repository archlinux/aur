# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=portmod
pkgver=2.0_beta6
pkgrel=1
pkgdesc="A cli tool to manage mods for OpenMW"
provides=('portmod')
conflicts=('portmod')
replaces=('openmmm')
arch=(any)
url="https://gitlab.com/portmod/portmod"
license=(GPL3)
depends=("python" "patool" "python-setuptools" "python-colorama" "python-appdirs" "python-black" "python-gitpython"
         "python-progressbar" "python-restrictedpython" "bubblewrap" "omwcmd" "python-redbaron"
         "python-python-sat" "python-requests" "python-chardet")
makedepends=("python" "python-setuptools" "python-setuptools-scm" "rust" "python-setuptools-rust")
checkdepends=("python-pytest")
optdepends=("omwllf" "tes3cmd" "tr-patcher")
source=("https://gitlab.com/portmod/portmod/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('64cb5307a70d5e2fa718122406ffcbfbd938c0f62e58c3612ce699eb13d043db22a8a7cc4776d7dfbcde719a9d796db37a617b7f7abdf2a6ca396dfccaca4f9b')

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py build_rust --inplace --release
}

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  # Disabled check for beta4 due to known bug in test suite
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver pytest
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir
}
