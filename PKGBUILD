# Maintainer: Matthias gatto <matthias.gatto at outscale dot com>
# Reference: PKGBUILD(5)

pkgname=python-diagrams-git
pkgver=v0.17.0.r35.gdfd8e0a
pkgrel=1
pkgdesc='Diagram as Code'

arch=('any')
url='https://github.com/mingrammer/diagrams'
license=(MIT)

makedepends=('python-setuptools' 'python-dephell')

depends=("python-graphviz")

pkgver() {
  cd "${srcdir}/diagrams"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

source=("git://github.com/mingrammer/diagrams.git")
sha256sums=("SKIP")

prepare() {
    cd "${srcdir}/diagrams"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "${srcdir}/diagrams"
	python ./setup.py build
}

package() {
	cd "${srcdir}/diagrams"
	python  ./setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -D "${srcdir}/diagrams/LICENSE" "$pkgdir/usr/share/licenses/python-diagram/LICENSE"
}
