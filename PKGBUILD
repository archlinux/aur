# Maintainer: Hugo Hörnquist <hugo@lysator.liu.se>

pkgname=repofs
pkgver=0.2.6
pkgrel=1
pkgdesc="Filesystem view of version control repositories"
arch=('any')
license=('Apache')
makedepends=('python-setuptools')
checkdepends=('git')
depends=('python-fusepy' 'python-pygit2' 'python')
url='https://github.com/aueb-balab/repofs'
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('4c535cef5b5b6e6d325c51439f51e363')

check() {
	cd "$srcdir/RepoFS-$pkgver"
	make test
}

build() {
	cd "$srcdir/RepoFS-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/RepoFS-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -m644 -D -t "$pkgdir/usr/share/man/man1" repofs.1
}
