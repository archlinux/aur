# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-kademlia
_pkgname=${pkgname/python-/}
pkgver=0.5
pkgrel=4
pkgdesc="Distributed hash table for decentralized peer-to-peer computer networks"
url="http://github.com/bmuller/kademlia"
depends=('python' 'python-twisted' 'python-rpcudp')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/k/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('5069c5d404226165ed30b9384be5dedf5f16b065ddf2344c66aa3222583e1d94')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    patch -p1 < "$srcdir/../0001-storage-Python-3-fix-for-izip.patch"
    patch -p1 < "$srcdir/../0002-storage-Python-3-fix-for-imap.patch"
    patch -p1 < "$srcdir/../0003-storage-Python-3-fix-for-zope.interface.patch"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}

