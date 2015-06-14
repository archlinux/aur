# Maintainer : Skydrome <irc.freenode.net>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: giniu <gginiu@gmail.com>

pkgname=python2-foolscap-i2p
pkgver=0.6.4
pkgrel=4
pkgdesc="RPC protocol for Python and Twisted over the I2P network"
url="http://foolscap.lothar.com"
license=('MIT')
arch=('any')
conflicts=('python2-foolscap')
provides=('python2-foolscap')
options=(!emptydirs)

depends=('twisted'
         'python2'
         'python2-pyopenssl')

_patchver="${pkgver}-r0"
source=("http://foolscap.lothar.com/releases/foolscap-${pkgver}.tar.gz"
        "http://foolscap.lothar.com/releases/foolscap-${pkgver}.tar.gz.asc"
        #"0001-proxy-support.patch"
        #"0002-recognize-i2p-dests.patch"
        "http://killyourtv.i2p.us/tahoe-lafs/patches/foolscap-i2p-${_patchver}.patch")

validpgpkeys=('734145FEBE70E5D059C7EDCD3E8692AFAF1B4A2A')

sha256sums=('74b283dd68a3c9d68ebf4e9b4ebf5cfb37480915b6a808ac930fe858a66f8d99'
            'SKIP'
            'c0b6239119f85fa79b3b983886a2aa42d9bf588c649c5a13ad8f8a358f90b9b7')

prepare() {
    cd "${srcdir}/foolscap-${pkgver}"
    for p in $(ls ${srcdir}/*.patch); do
        patch -Np1 -i $p
    done
}

build() {
    cd "${srcdir}/foolscap-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/foolscap-${pkgver}"
    python2 setup.py install --prefix=/usr --root="$pkgdir"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
