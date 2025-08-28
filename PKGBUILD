# Maintainer: envolution
# Contributor: éclairevoyant
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=theharvester-git
pkgver=4.8.2.r55.g70e5c171
pkgrel=1
pkgdesc="Gather emails, names, subdomains, IPs and URLs related to targets using public sources"
arch=(any)
url="https://github.com/laramies/theHarvester"
license=(GPL-2.0-only) #as per pyproject.toml
depends=(
	python-aiodns
	python-aiofiles
	python-aiohttp
	python-aiomultiprocess
	python-aiosqlite
	python-beautifulsoup4
	python-censys
	python-certifi
	python-dnspython
	python-fastapi
	python-lxml
	python-netaddr
	python-ujson
	python-yaml
	python-requests
	python-retrying
	python-shodan
  python-playwrite
  python-slowapi
	uvicorn
	python-uvloop
)
makedepends=(git python-{build,installer,wheel} python-setuptools)
checkdepends=(python-pytest)
install="theHarvester.install"
source=("$pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $pkgname
	python -m build -wn
}

check() {
	cd $pkgname
	export PYTHONPATH="$PWD/build/lib/theHarvester"
	python -m pytest
}

package() {
	cd $pkgname
	python -m installer -d "$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
