# Maintainer:
pkgname=python-protobuf-compiler
_name=protobuf_compiler
pkgver=1.0.20
pkgrel=2
pkgdesc="Compile all protobuf files and create a single package distribution for installing with pip"
arch=('any')
url="https://github.com/netsaj/python-protobuf-compiler"
license=('MIT')
depends=('python-grpcio-tools' 'python-colorama' 'python-termcolor' 'python-tqdm')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/netsaj/$pkgname/master/LICENSE")
sha256sums=('ac8daa7187fb9cac7752008368b79d8d8e44dd1b154423fa7afd227a31d062f6'
            '67dbc546c9f988b222b0d3d0c747e77eee53c53146257b17debf82aa2c567f3e')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
