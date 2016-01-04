# Maintainer: Simon Hanna <simon dot hanna at serve-me dot info>
pkgname=onionshare
pkgver=0.8.1
pkgrel=1
pkgdesc="Lets you securely and anonymously share a file of any size with someone"
url="https://github.com/micahflee/onionshare"
arch=('any')
license=('GPL3')
makedepends=('python2-setuptools')
checkdepends=('python2-nose')
depends=('python2-stem-git' 'python2-flask')
optdepends=(
          'python2-pyqt4: to run onionshare-gui'
          'tor-browser-en: before you can share a file, you need to open Tor Browser'
          'tor-messenger-bin: tor-messenger can be used as an alternative to Tor Browser'
          )
source=(https://github.com/micahflee/onionshare/archive/v$pkgver.tar.gz)
sha512sums=('7c0e45a92ed6c850a5a84ff7af7b6160111464d8577cb962a2c1b89cd1c8d60cf4e8757a1decac9aadb1915357ff417a195789f01d6297a26076b95ef03f610d')

build() {
 	cd "$srcdir/onionshare-$pkgver"
  python2 setup.py build 
}

check() {
 	cd "$srcdir/onionshare-$pkgver"
  nosetests2 test
}

package() {
	cd "$srcdir/onionshare-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1
	install -D -m 644 install/onionshare.desktop "${pkgdir}/usr/share/applications/"
	install -D -m 644 install/onionshare80.xpm "${pkgdir}/usr/share/pixmaps/"
}

# vim:set ts=2 sw=2 et:
