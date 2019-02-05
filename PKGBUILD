# Maintainer: Colin Unger <mastakata 3 at yahoo dot com>

pkgname=python-angr-git
pkgdesc="A powerful and user-friendly binary analysis platform"
url="https://github.com/angr/angr"
pkgver=8.18.10.25.r9156.a67010c8
pkgrel=1
arch=('any')
depends=('python' 'python-sortedcontainers' 'python-cachetools' 'python-capstone' 'python-cooldict-git' 'python-dpkt' 'python2-futures' 'python-mulpyplexer-git' 'python-networkx' 'python-progressbar' 'python-rpyc' 'python-cffi' 'python-unicorn' 'python-archinfo-git' 'python-claripy-git' 'python-cle-git' 'python-pyvex-git' 'python-ailment-git' 'python-gitpython' 'python-pycparser' 'python-itanium_demangler-git' 'python-psutil')
makedepends=('git' 'python-setuptools' 'make' 'gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
license=('BSD')
source=("$pkgname::git+https://github.com/angr/angr.git#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	regex='[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+'
	prefix='ticked version number to'
	rev_num="$(git rev-list --count HEAD)"
	version_no="$(git log -n1 --grep "$prefix $regex" --format=tformat:%s | sed "s/$prefix \($regex\)/\1/g")"
	last_commit="$(git rev-parse --short HEAD)"
	echo "$version_no.r$rev_num.$last_commit"
}

build() {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
