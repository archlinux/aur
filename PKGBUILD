# Maintainer: Berrit Birkner <aur at bbirkner.de>
# Contributor: Raphaël Doursenaud <rdoursenaud@free.fr>
pkgname=qpageview-git
pkgver=1.0.0.r4.g4066284
pkgrel=1
pkgdesc="A page based document viewer widget for Qt6/PyQt6."
arch=('any')
url="https://github.com/frescobaldi/qpageview"
license=('GPL-3.0-or-later')
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-hatchling'
)
depends=(
  'python>=3.6'
  'python-pyqt6'
  'qt6-base'
  'qt6-svg'
)
optdepends=(
   'python-pycups: Printing to a local CUPS server'
)
provides=("${pkgname%-git}=$pkgver-$pkgrel" "python-qpageview")
conflicts=("${pkgname%-git}" "ly" "python-qpageview")
options=(!emptydirs)
source=("$pkgname"::'git+https://github.com/frescobaldi/qpageview.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
