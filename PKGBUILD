# Maintainer: Caleb Chase <firstname at lastnamefirstname dot com>
pkgname=ledger-autosync-git
pkgver=r202.5892b62
pkgrel=1
pkgdesc="Pull down transactions from your bank and create ledger transactions for them"
arch=("any")
url="https://gitlab.com/egh/ledger-autosync"
license=('GPL3')
depends=('python2' 'ofxclient-git' 'ofxparse-git')
optdepends=('ledger')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/egh/ledger-autosync.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
        # Fix shebangs
        find . -type f -exec sed -i 's/env python$/&2/' {} +
}

build() {
	cd "$srcdir/${pkgname%-git}"
        python2 setup.py build
}

check() {
	cd "$srcdir/${pkgname%-git}"
        # TODO: run unit tests?
}

package() {
	cd "$srcdir/${pkgname%-git}"
        python2 setup.py install --root="$pkgdir" --optimize=1
}
