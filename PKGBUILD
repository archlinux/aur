# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ralf Schmitt <ralf@systemexit.de>

pkgname=python38-greenlet
pkgver=2.0.1
pkgrel=1
pkgdesc="Lightweight in-process concurrent programming"
license=("MIT")
arch=('x86_64')
url="https://pypi.org/project/greenlet/"
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-objgraph' 'python38-psutil')
source=("https://files.pythonhosted.org/packages/source/g/greenlet/greenlet-${pkgver}.tar.gz")
sha512sums=('3f4ccc761f64c7f10946d2fa965ef847e814ca1b6f57dc0df262cb6eed24148b44c6629770bf038656a9e3706e45553080844dfc841643604bd4776ca7ca03a2')

build() {
	cd greenlet-$pkgver
	python3.8 setup.py build
}

check() {
    cd greenlet-$pkgver
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-310" python3.8 -m unittest discover -v greenlet.tests
}

package() {
    cd greenlet-$pkgver
    python3.8 setup.py install -O1 --root="$pkgdir"
    install -Dm644 LICENSE.PSF -t "$pkgdir"/usr/share/licenses/$pkgname/
}
