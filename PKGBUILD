# Maintainer: PumpkinCheshire <$(base64 --decode <<<'c29sbHlvbnpvdUBnbWFpbC5jb20=')>
# Contributor: tembleking <tembleking at gmail dot com>

pkgname=('python-haversine')
_name=haversine
pkgver=2.3.1
pkgrel=1
pkgdesc="Calculate the distance (in various units) between two points on Earth using their latitude and longitude."
arch=("any")
url="https://github.com/mapado/haversine"
license=('MIT')
depends=('python')
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/mapado/haversine/master/LICENSE")
sha256sums=('75a7f859b3fb6df746564ca66ad1fd5b4052cdbab3d74ff16e8f1a7c3d4a26a5'
            '4a5b657ce0f6473ace15c292cd7f0d483b4eef1fd8f31c8a4d58c7a8c27eb20f')

# prepare() {
#     cp -r $_name-$pkgver $_name-$pkgver-py2
# }

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build

    # cd "$srcdir/$_name-$pkgver-py2"
    # python2 setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

# package_python2-haversine() {
#     depends=("python2")
#     cd "$srcdir/$_name-$pkgver-py2"
#     python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
#     #    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name-$pkgver/LICENSE"
# }
