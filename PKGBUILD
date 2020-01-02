# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pypi2pkgbuild
pkgname=python-$_pkgname-git
pkgver=0.1.r82.gb3b6ae9
pkgrel=1
pkgdesc="Convert PyPI packages to Arch Linux packages"
arch=('any')
url="https://github.com/anntzer/pypi2pkgbuild"
license=('MIT')
depends=(
	'namcap'
	'pkgfile'
	'python-pip'
	'python-wheel'
)
makedepends=(
	'git'
	'python-setuptools-scm'
)
conflicts=('python-pypi2pkgbuild')
source=("git+https://github.com/anntzer/pypi2pkgbuild.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | \
		sed 's/^v//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_pkgname"
	install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
