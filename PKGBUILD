# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-remi-git
pkgver=2020.03.10.r47.g5767ef2
pkgrel=1
pkgdesc="Cross-platform GUI library which renders in a web browser."
arch=('any')
url="https://github.com/dddomodossola/remi/"
license=("Apache")
depends=("python")
makedepends=("git")
options=(!emptydirs)
source=('git+https://github.com/dddomodossola/remi.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/remi"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$srcdir/remi"
	python setup.py install --root="$pkgdir/" --optimize=1
  cd "$pkgdir"
  rm -r usr/lib/python3.[1-9]/site-packages/test/
  rm -r usr/lib/python3.[1-9]/site-packages/editor/
  mkdir -p "usr/share/doc/python-remi-git"
  cp -r "$srcdir/remi/examples" "usr/share/doc/python-remi-git"
}

# vim:set ts=2 sw=2 et:
