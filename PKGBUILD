# Maintainer: Simon Hanna <thelinuxguy on freenode>
pkgname=onionshare
pkgver=1.2
pkgrel=1
pkgdesc="Lets you securely and anonymously share a file of any size with someone"
url="https://github.com/micahflee/onionshare"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
depends=('stem' 'python-flask' 'tor')
optdepends=(
          'python-pyqt5: to run onionshare-gui'
          'obfs4proxy: for tor bridge support'
          )
source=(
    https://github.com/micahflee/onionshare/archive/v$pkgver.tar.gz
    nautilus-python.patch
    )
sha512sums=('f410db0866a10d57cbc227a3539f92b3e4fe6b8fdb459abefc315ff3e342aad6876ab963e50ce2c74c8213d07291b9a950a0f61b9cf43767e9befd5f64de01ea'
            '6cc3b3d178bea9cd9fecaf735e82ad7ff7161ad4396086881d7e45a9a70bd55c1074ec65c6359a64417a42493f305caf7ba89e1c40c9a9def03dd1d11cb7efb7')


prepare() {
    cd "$srcdir/onionshare-$pkgver"
    patch  -i "${srcdir}/nautilus-python.patch"
}
#build() {
#    cd "$srcdir/onionshare-$pkgver"
#    python setup.py build
#}

check() {
    cd "$srcdir/onionshare-$pkgver"
    pytest test/
}

package() {
    cd "$srcdir/onionshare-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -D -m 644 install/onionshare.desktop "${pkgdir}/usr/share/applications/onionshare.desktop"
    install -D -m 644 install/onionshare80.xpm "${pkgdir}/usr/share/pixmaps/onionshare80.xpm"
}

# vim:set ts=2 sw=2 et:
