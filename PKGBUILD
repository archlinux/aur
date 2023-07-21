# Maintainer: Philipp Nowak <nowak dot philipp97 at gmail dot com>
# Contributor: Esteban López Rodríguez <gnu_stallman at protonmail dot ch>
# Contributor: Moon Sungjoon <sumoon at seolsaram dot com>
pkgname=norminette
pkgver=3.3.53
pkgrel=1
pkgdesc="C linter for 42 Network"
arch=('x86_64')
url='https://github.com/42School/norminette'
license=('MIT')
depends=('python>=3.8' 'python-setuptools')
conflicts=('norminette-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/42School/norminette/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('0c513da5e61a2728a659414081e60c00f0ae96f091dc98421485208803baae260ccaa01fcb6f75b84ec60ba9eef56980c5a5da0801c78dfbafe84132cf3a03f7') 

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
