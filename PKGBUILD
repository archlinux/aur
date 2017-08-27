# Maintainer: Carl George < arch at cgtx dot us >

_name="sanic"
pkgname="python-$_name"
pkgver=0.6.0
pkgrel=1
pkgdesc="A microframework based on uvloop, httptools, and learnings of flask"
arch=("any")
url="https://github.com/channelcat/sanic"
license=("MIT")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/channelcat/sanic/$pkgver/LICENSE")
sha256sums=('f70fbd2483e372494d023a08259ffbeb757b3bce10bbf4a00b17a405de3ff322'
            'a406579cd136771c705c521db86ca7d60a6f3de7c9b5460e6193a2df27861bde')

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
