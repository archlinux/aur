# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-kademlia
_pkgname=${pkgname/python-/}
pkgver=2.2.2
pkgrel=1
pkgdesc="Distributed hash table for decentralized peer-to-peer computer networks"
url="http://github.com/bmuller/kademlia"
depends=('python' 'python-rpcudp')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
            )
license=('MIT')
arch=('any')
source=("https://github.com/bmuller/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9fd3436ac83d115d9c0a596261b453626a8bc647c3aa6e198e7c296c8c3cdeb0')

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
