# Maintainer: vantu5z <vantu5z@mail.ru>

pkgname=python-qt-material-git
pkgver=r100.20201228
pkgrel=2
pkgdesc="This is another stylesheet for PySide6, PySide2 and PyQt5, which looks like Material Design."
url="https://github.com/UN-GCPDS/qt-material"
depends=('python>=3.6' 'python-jinja')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::git+https://github.com/UN-GCPDS/qt-material.git)
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	# get number of last git commit
	_commitCount=$(git rev-list --count HEAD)
	# get time of last git commit
	_commitTime=$(git show -s --format="%ci" | grep -o "....-..-.." | sed "s/-//g")
	# add "r*.*" from package version
	echo "r$_commitCount.$_commitTime"
}

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
