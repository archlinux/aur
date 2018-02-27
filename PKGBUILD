# Maintainer: Simon Hanna <thelinuxguy on freenode>
pkgname=onionshare
pkgver=1.3
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
# if you want nautilus integration you need to remove the nautilus patch
source=(
    https://github.com/micahflee/onionshare/archive/v$pkgver.tar.gz
    nautilus-python.patch
    )
sha512sums=('910928cf6e3672a8e59e452da1c5297b18f98854dbde836c02ef3458c33339f77cf16a0c5f2559ff364801a0e5ca2091bbb242aea8f6eaf00b0e8cbb6f261956'
            '6cc3b3d178bea9cd9fecaf735e82ad7ff7161ad4396086881d7e45a9a70bd55c1074ec65c6359a64417a42493f305caf7ba89e1c40c9a9def03dd1d11cb7efb7')


prepare() {
    cd "$srcdir/onionshare-$pkgver"
    patch  -i "${srcdir}/nautilus-python.patch"
}

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
