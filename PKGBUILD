# Maintainer: Carl George < arch at cgtx dot us >

_name="sanic"
pkgname="python-${_name}"
pkgver="0.1.9"
pkgrel="1"
pkgdesc="A microframework based on uvloop, httptools, and learnings of flask"
arch=("any")
url="https://github.com/channelcat/sanic"
license=("MIT")
makedepends=("python-setuptools")
source=("https://github.com/channelcat/sanic/archive/${pkgver}.tar.gz")
sha256sums=('d9bb3b0a051061219e9357df583031510241f3be3a7be4e3bd84d3f8461854cb')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    depends=("python-uvloop>=0.5.3"
             "python-httptools>=0.0.9"
             "python-ujson>=1.35"
             "python-aiofiles>=0.3.0"
             "python-multidict>=2.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
