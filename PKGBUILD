# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

pkgname=plantuml-markdown
pkgver=3.4.2
pkgrel=1
pkgdesc="PlantUML plugin for Python-Markdown"
arch=('any')
url="https://github.com/mikitex70/${pkgname}"
license=('BSD')
depends=('python-markdown' 'plantuml' 'python-plantuml-git')
makedepends=('python-setuptools')
checkdepends=('pymdown-extensions' 'python-mock' 'python-nose2')
changelog="CHANGELOG.md"	# https://raw.githubusercontent.com/mikitex70/plantuml-markdown/master/CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('7fbbe263f1e1cc3628237dc37e90b0cf')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	PATH="$PATH:$PWD/test" python -m unittest discover -v -s test
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
