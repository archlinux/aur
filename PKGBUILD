# Maintainer: jakob <grandchild@gmx.net>
# Contributor: Christian Schwarz <me@cschwarz.com>

pkgname=servefile
pkgver=0.5.4
pkgrel=1
pkgdesc="Serve or receive files from shell via a small HTTP server"
arch=('any')
url="https://github.com/sebageek/servefile"
license=('GPL3')
depends=('python')
optdepends=('python-pyopenssl: HTTPS support')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-pyopenssl')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/sebageek/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8ded2b42095bc1412a048103fcd7754edba6fe1bfd34f52b58cdf62f518da3bd')

check() {
    cd "$srcdir/$pkgname-$pkgver"
    pytest
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -D servefile.1 "$pkgdir/usr/share/man/man1/servefile.1"
}
