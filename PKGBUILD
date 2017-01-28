# Maintainer: Carl George < arch at cgtx dot us >

_name="sanic"
pkgname="python-$_name"
pkgver=0.3.0
pkgrel=1
pkgdesc="A microframework based on uvloop, httptools, and learnings of flask"
arch=("any")
url="https://github.com/channelcat/sanic"
license=("MIT")
makedepends=("python-setuptools")
source=("https://github.com/channelcat/sanic/archive/$pkgver.tar.gz")
sha256sums=('bee1f2df2494af386085d8d4767de5d8c817b706d987faa57c29a527995e393f')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    depends=("python-uvloop>=0.5.3"
             "python-httptools>=0.0.9"
             "python-ujson>=1.35"
             "python-aiofiles>=0.3.0")
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
