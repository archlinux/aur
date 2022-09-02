# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: BrainDamage

pkgname='comic-dl'
pkgver=2022.04.23
pkgrel=2
pkgdesc='Comic-dl is a command line tool to download Comics and Manga from various Manga and Comic sites easily.'
arch=(any)
url="https://github.com/Xonshiz/${pkgname}"
license=('MIT')
optdepends=('phantomjs: to access some sites')
depends=(
	'python' 'python-tqdm' 'python-requests'
	'python-clint' 'img2pdf' 'python-colorama' 'python-future' 
	'python-beautifulsoup4' 'python-cloudscraper'
	'nodejs' 'python-jsbeautifier' 'python-beautifulsoup4')
sha256sums=('43f9c0f057372a191a2ff6aeff6de64f19f474eae8e29ec18c59b079cc7e3a2d')
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

