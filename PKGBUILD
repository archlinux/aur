# Maintainer: Ye Shu <shuye02@outlook.com>

pkgname=onionshare
pkgver=2.0
pkgrel=2
pkgdesc="Lets you securely and anonymously share a file of any size with someone"
url="https://github.com/micahflee/onionshare"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
depends=('stem' 'python-flask' 'tor' 'python-pycryptodome' 'python-pysocks' 'python-requests' 'python-pyqt5')
optdepends=(
    'python-nautilus: to enable Nautilus  right-click extension'
    'obfs4proxy: for tor bridge support'
)

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/micahflee/onionshare/archive/v$pkgver.tar.gz"
)
sha512sums=('1c3dbe90b52b1147f5dbe686453e518100fe7d71428a14231451c3e4a6f2aa8b4d1e5ea64cbb753ce2d7c3789f1479b9a715d2a68288dcf33e50070fb693520d')

check() {
    cd "$srcdir/onionshare-$pkgver"
    pytest tests/
}

package() {
    cd "$srcdir/onionshare-$pkgver" || return $?
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 install/onionshare.desktop "${pkgdir}/usr/share/applications/onionshare.desktop"
    install -Dm644 install/onionshare80.xpm "${pkgdir}/usr/share/pixmaps/onionshare80.xpm"
}
