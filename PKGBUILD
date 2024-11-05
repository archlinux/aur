# Maintainer: Korialo <korialo001[at]gmail[dot]com>
_pkgname=pysubs2
pkgname=python-pysubs2-git
pkgver=1.7.3.r2.g04837a4
pkgrel=2
pkgdesc="A Python library for editing subtitle files"
arch=('any')
url="https://github.com/tkarabela/pysubs2"
license=('MIT')
groups=()
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
provides=('python-pysubs2=1.7.3')
conflicts=('python-pysubs2')

pkgver() {
	cd $pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

