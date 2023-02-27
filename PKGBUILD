# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: BrainDamage

pkgname='comic-dl'
pkgver=2023.01.08.2
pkgrel=1
pkgdesc='Command line tool to download Comics and Manga from various Manga and Comic sites easily.'
arch=(any)
url="https://github.com/Xonshiz/${pkgname}"
license=('MIT')
optdepends=('phantomjs: to access some sites')
depends=(
	'python' 'python-tqdm' 'python-requests'
	'python-clint' 'img2pdf' 'python-colorama' 'python-future' 
	'python-beautifulsoup4' 'python-cloudscraper'
	'nodejs' 'python-jsbeautifier')
sha256sums=('6d66c2e92fbe6aea56bf1fa82d30f0fabcd0cb5c4320da40329c72b4c94905e9')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xonshiz/${pkgname}/archive/$pkgver.tar.gz")

_srcdir="$pkgname-$pkgver"

prepare() {
	cd "$_srcdir"

	printf '%s\n' '#!/usr/bin/env python' > "${pkgname}"
	cat 'cli.py' >> "${pkgname}"
	
	python 'setup.py' build
}

package() {
	cd "$_srcdir"
	
	python 'setup.py' install --optimize=1 --root="$pkgdir/" --prefix="/usr"
	install -Dm755 "${pkgname}" -t "$pkgdir/usr/bin/"
}

