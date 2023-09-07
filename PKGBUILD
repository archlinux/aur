# Maintainer: Philipp Nowak <nowak dot philipp97 at gmail dot com>
# Contributor: Esteban López Rodríguez <gnu_stallman at protonmail dot ch>
# Contributor: Moon Sungjoon <sumoon at seolsaram dot com>
pkgname=norminette
pkgver=3.3.54
pkgrel=1
pkgdesc="C linter for 42 Network"
arch=('x86_64')
url='https://github.com/42School/norminette'
license=('MIT')
depends=('python>=3.8' 'python-setuptools')
conflicts=('norminette-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/42School/norminette/archive/refs/tags/$pkgver.tar.gz")
b2sums=('dcbdae2ac1141905ca69bb4c14f55d8d1a47035787e7029ea4aa8d3ea3a804f78af7028a3de41528f4a237d31ec2c3ce93667caf1cd6f45a8376069570f30c44')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	# Create license directory
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

	# Copy license file from the source directory to the license directory
	install -m644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
