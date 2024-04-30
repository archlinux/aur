# Maintainer: Matthias gatto <matthias.gatto at outscale dot com>
# Reference: PKGBUILD(5)

pkgname=python-diagrams-git
pkgver=0.23.4.r4.g4c2d8a37
pkgrel=1
pkgdesc='Diagram as Code'

arch=('any')
url='https://github.com/mingrammer/diagrams'
license=(MIT)

makedepends=('python-poetry' 'git')
depends=("python-graphviz")

pkgver() {
  cd "${srcdir}/diagrams"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

conflicts=('python-diagrams')
provides=("python-diagrams=${pkgver%.r*}")

source=("git+https://github.com/mingrammer/diagrams.git")
sha256sums=("SKIP")

build() {
    cd "${srcdir}/diagrams"
    poetry build --format wheel
}

package() {
	cd "${srcdir}/diagrams"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -D "${srcdir}/diagrams/LICENSE" "$pkgdir/usr/share/licenses/python-diagram/LICENSE"
}
