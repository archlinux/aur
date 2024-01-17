# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-remi-git
pkgver=2022.7.27.r24.g4be71eb
pkgrel=1
pkgdesc="Cross-platform GUI library which renders in a web browser."
arch=('any')
url="https://github.com/dddomodossola/remi/"
license=("Apache")
depends=("python" "python-matplotlib" "python-pillow" "python-setuptools")
makedepends=("git")
options=(!emptydirs)
source=('git+https://github.com/dddomodossola/remi.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/remi"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
  #version=`cat setup.py | grep version= | sed "s/\s\+version='//g" | sed "s/',//g"`
  #printf "%s.%s" "$version" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/remi"
	python setup.py install --root="$pkgdir/" --optimize=1
  cd "$pkgdir"
  rm -r usr/lib/python3.[0-9]*/site-packages/test/
  rm -r usr/lib/python3.[0-9]*/site-packages/editor/
  mkdir -p "usr/share/doc/python-remi-git"
  cp -r "$srcdir/remi/examples" "usr/share/doc/python-remi-git"
}

# vim:set ts=2 sw=2 et:
