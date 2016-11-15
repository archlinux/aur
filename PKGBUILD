# Maintainer: Simon Hanna <simon dot hanna at serve-me dot info>
pkgname=onionshare
pkgver=0.9.2
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
sha512sums=('b1ce10783dcee6fef1d5ffbef252e6db32b2150fe9610345745d7e4bf10c25f1077bdaea80353cab6756521e20b179c72cad8daf6a5159a199a2dc727475759a')

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
