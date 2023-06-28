# Contributor: chr0mag <phillips.julian AT gmail DOT com>

pkgname=sos
pkgver=4.5.5
pkgrel=1
pkgdesc="unified tool for collecting system logs and other debug information"
arch=('any')
url="https://github.com/sosreport/sos"
license=('GPL2')
depends=('python'
	 'python-six'
	 'python-lxml')
makedepends=('python-sphinx' 'python-setuptools') 
checkdepends=(python-pexpect python-coverage python-pycodestyle python-pyaml)
backup=('etc/sos.conf')
_archpullreq="1198.patch"
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/sosreport/sos/archive/$pkgver.tar.gz"
	      "https://patch-diff.githubusercontent.com/raw/sosreport/sos/pull/$_archpullreq")
sha256sums=('8a5ebe38ade95f0cd7d5b2388fedd91239c117709c0f7d533824112cda65b605'
            '2b99f0cb275438c3b1a5f6e260bd057851c14408398e0d25486c642c1c739723')


prepare() {
	cd "$pkgname-$pkgver"
	# Currently doesn't work with 4.x.x
	#patch --strip=1 < ../$_archpullreq
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
