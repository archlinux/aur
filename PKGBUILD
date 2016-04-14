# Maintainer: Simon Hanna <simon dot hanna at serve-me dot info>
pkgname=onionshare
pkgver=0.9
pkgrel=1
pkgdesc="Lets you securely and anonymously share a file of any size with someone"
url="https://github.com/micahflee/onionshare"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools')
checkdepends=('python-nose')
depends=('stem' 'python-flask')
optdepends=(
          'python-pyqt5: to run onionshare-gui'
          'tor-browser-en: before you can share a file, you need to open Tor Browser'
          'tor-messenger-bin: tor-messenger can be used as an alternative to Tor Browser'
          )
source=(https://github.com/micahflee/onionshare/archive/v$pkgver.tar.gz)
sha512sums=('5a9a731629e3f00be355c73e1638eea5201e8fe57dc4cab623875add3d893bbe9ae134e020f2489b40c62e1017774423dc8260e2adc0dbc340936196c70e6b6d')

build() {
 	cd "$srcdir/onionshare-$pkgver"
  python setup.py build
}

check() {
 	cd "$srcdir/onionshare-$pkgver"
  nosetests test
}

package() {
	cd "$srcdir/onionshare-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -D -m 644 install/onionshare.desktop "${pkgdir}/usr/share/applications/"
	install -D -m 644 install/onionshare80.xpm "${pkgdir}/usr/share/pixmaps/"
}

# vim:set ts=2 sw=2 et:
