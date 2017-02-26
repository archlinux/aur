# Maintainer: Simon Hanna <simon dot hanna at serve-me dot info>
pkgname=onionshare
pkgver=1.0
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
sha512sums=('c218c0ea978b67b658634f6bb6f0dc5e7691e0fccf49a1d22be9ca688c6f9954a73e73fd5a72c8a0dee8a4c2f4eedc4a90af047920070fe831f4df1e2d4697fa')

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
	install -D -m 644 install/onionshare.desktop "${pkgdir}/usr/share/applications/onionshare.desktop"
	install -D -m 644 install/onionshare80.xpm "${pkgdir}/usr/share/pixmaps/onionshare80.xpm"
}

# vim:set ts=2 sw=2 et:
