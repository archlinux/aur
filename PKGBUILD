# Maintainer: Adhityaa Chandrasekar <c.adhityaa@gmail.com>
pkgname=coala
pkgver=0.10.0
pkgrel=1
pkgdesc="A unified command-line interface for linting and fixing all your code, regardless of the programming languages you use."
arch=('any')
url="https://coala.io/"
license=('AGPL-3.0')
depends=(
            'python'
            'python-setuptools'
            'python-appdirs'
            'python-requests'
        )
makedepends=('python-setuptools')
provides=('coala')
source=('https://pypi.io/packages/source/c/coala/coala-0.10.0.tar.gz')
sha256sums=('5ecc4981ce7e5e5020fe207bf0cdc7ea3b7c307916ea247d18a58edc48ea822f')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
    sudo pip3 install -r requirements.txt -r test-requirements.txt
    python3 setup.py build
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
    # the `tests/` directory is never distributed in any of our stable releases
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
