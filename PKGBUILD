# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-rpcudp
_pkgname=${pkgname/python-/}
pkgver=4.0.2
pkgrel=2
pkgdesc="RPC via UDP"
url="http://github.com/bmuller/rpcudp"
depends=('python' 'python-u-msgpack')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
            )
license=('MIT')
arch=('any')
source=("https://github.com/bmuller/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7e77fa297dbd7d47cd122abf77b7c9a9a0882206e5011a3be5de990045b8b348')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    local site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
    rm -rf "${pkgdir}${site_packages}/${_pkgname}/tests"
}
