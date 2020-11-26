# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-kademlia
_pkgname=${pkgname/python-/}
pkgver=2.2.1
pkgrel=1
pkgdesc="Distributed hash table for decentralized peer-to-peer computer networks"
url="http://github.com/bmuller/kademlia"
depends=('python' 'python-rpcudp')
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/bmuller/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('94d9ed1047273541d547ad99ea8f370be00a053fbf032cc0d983fe9b606d2c2d')

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
