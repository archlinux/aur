# Maintainer: envolution
# Contributor: éclairevoyant
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=theharvester-git
pkgver=4.8.2.r66.g5116b856
pkgrel=1
pkgdesc="Gather emails, names, subdomains, IPs and URLs related to targets using public sources"
arch=(any)
url="https://github.com/laramies/theHarvester"
license=(GPL-2.0-only) #as per pyproject.toml
depends=(
	python-aiodns
	python-aiohttp
	python-aiomultiprocess
	python-aiosqlite
	python-beautifulsoup4
	python-certifi
	python-fastapi
	python-netaddr
	python-ujson
	python-yaml
	python-shodan
  python-playwright
  python-slowapi
	uvicorn
	python-uvloop
)
makedepends=(git python-{build,installer,wheel} python-setuptools)
checkdepends=(python-pytest python-requests python-httpx)
optdepends=('python-httpx: alternative to aiohttp')
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
	python -m pytest || true
}

package() {
	cd $pkgname
	python -m installer -d "$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
