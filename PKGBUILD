# Maintainer: Berrit Birkner <aur at bbirkner.de>
# Contributor: Raphaël Doursenaud <rdoursenaud@free.fr>
pkgname=qpageview-git
pkgver=0.6.2.r8.gc308c2d
pkgrel=1
pkgdesc="A page based document viewer widget for Qt5/PyQt5."
arch=('any')
url="https://github.com/frescobaldi/qpageview"
license=('GPL')
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-hatchling'
)
depends=(
  'python>=3.6'
  'python-pyqt5'
  'qt5-base'
)
optdepends=(
   'python-poppler-qt5: Display PDF documents'
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
