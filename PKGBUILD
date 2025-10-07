# Maintainer: Luke Labrie-Cleary <luke.cleary@copenhagenatomics.com>
pkgname=python-endf
pkgver=0.1.9.r0.g5681381
pkgrel=1
pkgdesc="Python ENDF Parser"
arch=('x86_64')
url="https://github.com/paulromano/endf-python"
license=('MIT')

depends=(
   python
   pybind11
)

makedepends=(
	git
	python
	python-build
	python-installer
	python-wheel
)

provides=("${pkgname%-pkgver}")
source=("$pkgname::git+https://github.com/paulromano/endf-python.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    python \
      -m build \
      --wheel \
      --no-isolation
  }

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # make git repo available in opt 
    cd "$srcdir"
    mkdir $pkgdir/opt
    cp -r $pkgname $pkgdir/opt
}

