# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=sucks
pkgver=0.8.4
pkgrel=1
pkgdesc="Simple command-line script for the Ecovacs series of robot vacuums"
arch=(any)
url="https://github.com/wpietri/sucks"
license=('GPL')
depends=('python' 'python-sleekxmpp' 'python-click' 'python-requests' 'python-pycryptodome' 'python-pycountry-convert' 'python-pytest-mock' 'python-stringcase')
checkdepends=('python-nose' 'python-requests-mock')
optdepends=('bash-completion')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('c5f5b429d5f9fe7dcccdd8e1d1d0589250336fde11d51d5e2093da97eda8bd0176c5e6e8db1acdd73c358eeb4ae635e2137aa3b1c98b78e28bc3e656cf91e348')

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	nosetests
}

package() {
	cd $srcdir/$pkgname-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1
	PYTHONPATH="$pkgdir/usr/lib/python3.6/site-packages:$PYTHONPATH" _SUCKS_COMPLETE=source $pkgdir/usr/bin/sucks | install -Dm644 /dev/stdin $pkgdir/usr/share/bash-completion/completions/sucks
}
