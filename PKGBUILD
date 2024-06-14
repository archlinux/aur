# Maintainer: Kylie CT <kyliepc@proton.ne>
# Contributor: Mark Wagie <mark.wagie@proton.me>
# Contributor: David Runge <dave@sleepmap.de>
pkgname=python-yapsy-git
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"

pkgver=release_Yapsy.1.12.2.r17.g6b487b0
pkgrel=1

pkgdesc="A simple plugin system for Python applications (built from the latest commit)"
arch=('any')
url="https://github.com/tibonihoo/yapsy"
license=('BSD-2-Clause')

depends=('python' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
#checkdepends=('python-pytest')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$_srcname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname/package"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$_srcname"
#  pytest
#}

package() {
  cd "$_srcname/package"

  python -m installer --destdir="$pkgdir" dist/*.whl


  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
