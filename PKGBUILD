pkgname=ntfy-git
pkgver=v2.0.1.r2.g30308ca
pkgrel=1
pkgdesc="A utility for sending push notifications to different backends (Pushover, Pushbullet, XMPP and various desktop notification systems)"
url="https://github.com/dschep/ntfy"
depends=('python' 'python-yaml' 'python-requests' 'python-appdirs' 'python-ruamel.yaml' 'python-setuptools')
makedepends=('python' 'git')
license=('GPLv3')
arch=('any')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git");
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 
}
