# Maintainer: Kevin Azzam <aur at kevin.azz.am>
# Contributor: Ye Shu <shuye02 at outlook.com>

pkgname=onionshare
pkgver=2.2
pkgrel=2
pkgdesc="Lets you securely and anonymously share a file of any size with someone"
url="https://github.com/micahflee/onionshare"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
depends=('stem' 'python-flask' 'python-flask-httpauth' 'tor' 'python-pycryptodome' 'python-pysocks' 'python-requests' 'python-pyqt5')
optdepends=(
    'python-nautilus: to enable Nautilus right-click extension'
    'obfs4proxy: for tor bridge support'
)

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/micahflee/onionshare/archive/v$pkgver.tar.gz"
)
sha512sums=('1c2575bc8254d6123294dc9a47e700e0a346e3ba22b71994546853a34377d7fef5abb38c78cfd08badce35d16ae55633ea52d42589323e6dd484a192a8993c38')

check() {
    cd "$srcdir/onionshare-$pkgver"
    pytest tests/
}

package() {
    cd "$srcdir/onionshare-$pkgver" || return $?
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 install/onionshare80.xpm "${pkgdir}/usr/share/pixmaps/onionshare80.xpm"
}
