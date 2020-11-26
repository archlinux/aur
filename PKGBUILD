# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-rpcudp
_pkgname=${pkgname/python-/}
pkgver=4.0.1
pkgrel=1
pkgdesc="RPC via UDP"
url="http://github.com/bmuller/rpcudp"
depends=('python' 'python-umsgpack')
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/bmuller/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ea64f0ff8c830b1b522dde2832de9e4ae2391f00684addf84690a286454a4389')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    local site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
    rm -rf "${pkgdir}${site_packages}/${_pkgname}/tests"
}
