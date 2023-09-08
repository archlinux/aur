# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor:  Konstantinos Tampouris <ktamp@chem.uoa.gr>
# Contributor: FJ <joostef@gmail.com>
# Contributor: Zaplanincan <zaplanincan@gmail.com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>

pkgname=dosage
pkgver=3.0
pkgrel=1
pkgdesc='A comic downloader and archiver.'
arch=('any')
url='https://dosage.rocks'
license=('MIT')
depends=('python' 'python-colorama' 'python-imagesize' 'python-lxml' 'python-platformdirs' 'python-requests')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/webcomics/$pkgname.git#tag=$pkgver")
md5sums=('SKIP')

_srcdir="$pkgname"

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 'COPYING' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname"
	install 'doc'/* "$pkgdir/usr/share/doc/$pkgname"
}

