# Maintainer: éclairevoyant

pkgname=theharvester-git
pkgver=4.2.0.r254.g5065d6c
pkgrel=1
pkgdesc="Gather emails, names, subdomains, IPs and URLs related to targets using public sources"
arch=('any')
url="https://github.com/laramies/theHarvester"
license=('GPL2')
depends=(
	'python-aiodns'
	'python-aiofiles'
	'python-aiohttp'
	'python-aiomultiprocess'
	'python-aiosqlite'
	'python-argparse'
	'python-beautifulsoup4'
	'python-censys'
	'python-certifi'
	'python-dnspython'
	'python-fastapi'
	'python-lxml'
	'python-netaddr'
	'python-ujson'
	'python-pyppeteer'
	'python-yaml'
	'python-requests'
	'python-retrying'
	'python-shodan'
	'uvicorn'
	'python-uvloop'
)
makedepends=('git' 'python-setuptools' 'python-pytest')
install="theHarvester.install"
source=("$pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $pkgname
	python setup.py build
}

check() {
	cd $pkgname
	pytest
}

package() {
	cd $pkgname
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
