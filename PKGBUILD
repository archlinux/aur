# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=sucks
pkgver=0.9.4
pkgrel=1
pkgdesc="Simple command-line script for the Ecovacs series of robot vacuums"
arch=(any)
url="https://github.com/wpietri/sucks"
license=('GPL')
depends=('python' 'python-sleekxmpp' 'python-click' 'python-requests' 'python-pycryptodome' 'python-pycountry-convert' 'python-pytest-mock' 'python-stringcase')
checkdepends=('python-nose' 'python-requests-mock')
optdepends=('bash-completion')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('5e0f7471ff55cf97739e17ec36e0c24e20886f29c3128300b6feac73993806753d333ed49a1591201e45497e32a1204b36a5c7f78af7b71607ba7b36294622dc')

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
