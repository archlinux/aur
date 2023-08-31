# Maintainer: Matthias gatto <matthias.gatto at outscale dot com>
# Reference: PKGBUILD(5)

pkgname=python-diagrams-git
pkgver=v0.23.3.r9.gb19b0976
pkgrel=1
pkgdesc='Diagram as Code'

arch=('any')
url='https://github.com/mingrammer/diagrams'
license=(MIT)

makedepends=('python-pip' 'python-poetry')
depends=("python-graphviz")

pkgver() {
  cd "${srcdir}/diagrams"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

source=("git+https://github.com/mingrammer/diagrams.git")
sha256sums=("SKIP")

build() {
    cd "${srcdir}/diagrams"
    poetry build --format wheel
}

package() {
	cd "${srcdir}/diagrams"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps dist/*.whl
	install -D "${srcdir}/diagrams/LICENSE" "$pkgdir/usr/share/licenses/python-diagram/LICENSE"
}
