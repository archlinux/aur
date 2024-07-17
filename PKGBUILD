# Maintainer: pryme-svg <edoc.www@gmail.com>
pkgname=python-openmc-plotter-git
_name=plotter
pkgver=v0.4.0.r27.g293067c
pkgrel=1
pkgdesc='Plotting tool for OpenMC models and tally data'
arch=('any')
url="https://github.com/openmc-dev/plotter"
license=(MIT)
makedepends=(openmc-git python-numpy python-matplotlib pyside6)
depends=()
checkdepends=(python-pytest-runner python-pytest-qt)
source=(git+$url)
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_name
	python setup.py build
}

package() {
    cd $_name
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check(){
    cd $_name
	python setup.py pytest
}

