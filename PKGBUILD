# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Konstantinos Tampouris <ktamp@chem.uoa.gr>
# Contributor: FJ <joostef@gmail.com>
# Contributor: Zaplanincan <zaplanincan@gmail.com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>

pkgname=dosage
pkgver=3.1
pkgrel=1
pkgdesc='A comic downloader and archiver.'
arch=('any')
url='https://dosage.rocks'
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/webcomics/$pkgname.git#tag=$pkgver")
sha256sums=('b17ee82760230cde0a391a0932328f945ab6f9efd3b4f9270b989b7c00d2c1f7')

_srcdir="$pkgname"

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

package() {
	depends+=('python-colorama' 'python-imagesize' 'python-lxml' 'python-platformdirs' 'python-requests')

	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 'COPYING' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname"
	install 'doc'/* "$pkgdir/usr/share/doc/$pkgname"
}

