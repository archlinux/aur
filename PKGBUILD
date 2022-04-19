# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: BrainDamage

pkgname='comic-dl'
pkgver=2022.04.19
pkgrel=1
pkgdesc='Comic-dl is a command line tool to download Comics and Manga from various Manga and Comic sites easily.'
arch=(any)
url="https://github.com/Xonshiz/${pkgname}"
license=('MIT')
optdepends=('phantomjs: to access some sites')
depends=(
	'python' 'python-tqdm' 'python-requests' 'python-cfscrape' 
	'python-clint' 'img2pdf' 'python-colorama' 'python-future' 
	'python-beautifulsoup4' 'python-cloudscraper' 'phantomjs' 
	'nodejs' 'python-jsbeautifier')
sha256sums=('e9a6c694a4f3716d981f84bfb3609c0e7eefdc98c83c461af7bea0528142c1fd')
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

