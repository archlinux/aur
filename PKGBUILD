# Maintainer: Philipp Nowak <aur at phnowak dot net>
# Contributor: Esteban López Rodríguez <gnu_stallman at protonmail dot ch>
# Contributor: Moon Sungjoon <sumoon at seolsaram dot com>
pkgname=norminette
pkgver=3.3.55
pkgrel=1
pkgdesc="C linter for 42 Network"
arch=('x86_64')
url='https://github.com/42School/norminette'
license=('MIT')
depends=('python>=3.8' 'python-setuptools')
conflicts=('norminette-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/42School/norminette/archive/refs/tags/$pkgver.tar.gz")
b2sums=('68278d0efbf76c0164f13f22185a3a5c9bd695779cd571bb2a1fa99f2932a6020f21d9f776659e5e124cffa90bf1c7624b3f03129c51fb2a4a114157e4abbf0d')

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
