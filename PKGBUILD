# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-single-version
_name=${pkgname#python-}
pkgver=1.2.2
pkgrel=1
pkgdesc="Small utility to define version string for Poetry-style Python project"
arch=('any')
url="https://github.com/hongquan/single-version"
license=('MIT')
depends=('python-first' 'python-importlib-metadata')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d8e98c3a363af7f4843d62693eef22bcfda923414cfca1ee1c6b8d55c840d3c2')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
