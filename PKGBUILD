# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: BrainDamage

pkgname='comic-dl'
pkgver=2024.02.10
pkgrel=1
pkgdesc='Command line tool to download Comics and Manga from various Manga and Comic sites easily.'
arch=(any)
url="https://github.com/Xonshiz/${pkgname}"
license=('MIT')
optdepends=('phantomjs: to access some sites')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
sha256sums=('d93934df55d065b43a4a754dfb5d2b20e7aae3698db28f5778284498f714301e')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xonshiz/${pkgname}/archive/$pkgver.tar.gz")

_srcdir="$pkgname-$pkgver"

prepare() {
	cd "$_srcdir"

	printf '%s\n' '#!/usr/bin/env python' > "${pkgname}"
	cat 'cli.py' >> "${pkgname}"
	
	#python 'setup.py' build
	python -m build --wheel --no-isolation
}

package() {
	depends+=('python-tqdm' 'python-requests'
		'python-clint' 'img2pdf' 'python-colorama' 'python-future' 
		'python-beautifulsoup4' 'python-cloudscraper'
		'nodejs' 'python-jsbeautifier')
	cd "$_srcdir"
	
	#python 'setup.py' install --optimize=1 --root="$pkgdir/" --prefix="/usr"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm755 "${pkgname}" -t "$pkgdir/usr/bin/"
}

