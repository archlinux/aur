# Maintainer: Carl George < arch at cgtx dot us >

_name="sanic"
pkgname="python-$_name"
pkgver=0.7.0
pkgrel=1
pkgdesc="A microframework based on uvloop, httptools, and learnings of flask"
arch=("any")
url="https://github.com/channelcat/sanic"
license=("MIT")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/channelcat/sanic/$pkgver/LICENSE")
sha256sums=('22b1a6f1dc55db8a136335cb0961afa95040ca78aa8c78425a40d91e8618e60e'
            'e7814de9a02ae20500778a5d1a4ab63c71a8f3072faf4ac669a143f2e71b72c5')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    depends=("python-uvloop>=0.5.3"
             "python-httptools>=0.0.9"
             "python-ujson>=1.35"
             "python-aiofiles>=0.3.0"
             "python-websockets>=3.2")
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE"
}
