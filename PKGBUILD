# Maintainer: nobodyinperson <nobodyinperson at posteo de>
pkgname=python-funcargparse-git
_pkgname="$pkgname"
_pkgname=${_pkgname#python-}
_pkgname=${_pkgname%-git}
pkgver=0.2.5.r0.g46bb7b9
pkgrel=3
pkgdesc="Create an argparse.ArgumentParser from function docstrings"
arch=(any)
url="https://github.com/Chilipp/funcargparse"
license=(LGPL3)
makedepends=(git python-build python-installer)
depends=(python)
conflicts=("python-${_pkgname}")
provides=("python-${_pkgname}")
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
