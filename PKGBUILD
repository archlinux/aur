# Maintainer: RunasSudo <archlinux@yingtongli.me>
pkgname=python-wa-crypt-tools-git
_pkgname="${pkgname%-git}"
_pkg="${_pkgname#python-}"
pkgver=r389.0c92577
pkgrel=2
pkgdesc='WhatsApp Crypt Tools'
arch=('any')
url='https://github.com/ElDavoo/wa-crypt-tools'
license=('GPL')
depends=('python-javaobj-py3' 'python-pycryptodomex' 'python-protobuf')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkg"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkg"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_pkg"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
