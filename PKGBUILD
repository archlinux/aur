# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Anselmo L. S. Melo <anselmo.melo@intel.com>

_pkgname=defcon
pkgname=python-$_pkgname-git
pkgver=0.8.1.r10.gd7828f0
epoch=1
pkgrel=1
pkgdesc='A set of UFO based objects for use in font editing applications'
arch=('any')
url="https://github.com/robotools/$_pkgname"
license=('MIT')
depends=('python' 'python-fonttools' 'python-fs')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'python-setuptools-scm')
optdepends=('python-fontpens' 'python-lxml')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
