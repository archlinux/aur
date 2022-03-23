# Maintainer: nobodyinperson <nobodyinperson at posteo de>
pkgname=python-psyplot-git
_pkgname="$pkgname"
_pkgname=${_pkgname#python-}
_pkgname=${_pkgname%-git}
pkgver=1.4.2.r16.g9a1f4f8
pkgrel=3
pkgdesc="Python package for interactive data visualization"
arch=(any)
url="https://github.com/$_pkgname/$_pkgname"
license=(LGPL3)
makedepends=(git python-build python-installer)
depends=(python-matplotlib python-yaml python-docrep python-xarray python-funcargparse)
provides=("python-${_pkgname}" "${_pkgname}")
conflicts=("${provides[@]}")
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
