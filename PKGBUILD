# Maintainer: Hugo Hörnquist <hugo@lysator.liu.se>

pkgname=repofs
pkgver=r152.5806312
pkgrel=2
pkgdesc="Filesystem view of version control repositories"
arch=('any')
license=('Apache')
makedepends=('python-setuptools')
checkdepends=('git')
depends=('python-fusepy' 'python-pygit2' 'python')
url='https://github.com/aueb-balab/repofs'
source=("${pkgname}::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
	cd "$srcdir/$pkgname"
	make test
}

build() {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -m644 -D -t "$pkgdir/usr/share/man/man1" repofs.1
}
