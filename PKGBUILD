# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=sucks
pkgver=0.8.3
pkgrel=2
pkgdesc="Simple command-line script for the Ecovacs series of robot vacuums"
arch=(any)
url="https://github.com/wpietri/sucks"
license=('GPL')
depends=('python' 'python-sleekxmpp' 'python-click' 'python-requests' 'python-pycryptodome' 'python-pycountry-convert' 'python-pytest-mock')
checkdepends=('python-nose' 'python-requests-mock')
optdepends=('bash-completion')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('458aeda0b84a58161793c618039f21e55a143635b3786e391b907a21964e60f5215712007d039eac92b2144013ea69e0743a8db20452ea4ce8bfeeca8c23ce8d')

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
	#_SUCKS_COMPLETE=source $pkgdir/usr/bin/sucks | install -Dm644 /dev/stdin $pkgdir/usr/share/bash-completion/completions/sucks
}
