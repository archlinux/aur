# Maintainer: nobodyinperson <nobodyinperson at posteo de>
pkgname=python-funcargparse-git
_pkgname=${pkgname#python-%-git}
pkgver=0.2.5.r0.g46bb7b9
pkgrel=1
pkgdesc="Create an argparse.ArgumentParser from function docstrings"
arch=(any)
url="https://github.com/Chilipp/funcargparse"
license=(LGPL3)
makedepends=(git)
depends=(python)
conflicts=("python-${_pkgname}")
source=("$pkgname::git+$url")
sha256sums=(SKIP)

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() { 
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir/" dist/*.whl
}

# vim:set ts=2 sw=2 et:
