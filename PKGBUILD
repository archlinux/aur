# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-dbutils
pkgver=1.2
pkgrel=1
pkgdesc="Suite of Python modules allowing to connect in a safe and efficient way between a threaded Python application and a database"
url="https://cito.github.io/w4py/"
license=('MIT')
depends=('python2')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/D/DBUtils/DBUtils-$pkgver.tar.gz"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/Cito/DBUtils/Release-1_2/LICENSE")
sha256sums=('fc185892248ff2e008b4ef92192b4247308404464d8508b225f8900caa163c6b'
            '09281f86418aa02de8683d9a2b82ec3cdf8d6ff182b612ee874a003c683b6ee1')

prepare() {
	cd "$srcdir/DBUtils-$pkgver"
	sed "s/'DBUtils.Examples', //g" -i setup.py
	rm -rf DBUtils/{Docs,Examples}
}

build() {
	cd "$srcdir/DBUtils-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/DBUtils-$pkgver"
	python2 setup.py install -O1 --skip-build --root="$pkgdir"
	install -Dm0644 "$srcdir/$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
