# Maintainer: dkasak <dkasak AT termina DOT org DOT uk>
# Contributor: Sebastian Neef <aur AT gehaxelt DOT IN>
# Contributor: ocelot <amitchell AT airmail DOT cc>

pkgbase=theharvester-git
pkgname=theharvester-git
pkgver=3.2.3.r18.ga6959ad
pkgrel=1
pkgdesc="An OSINT tool for gathering emails, names, subdomains, IPs and URLs related to a target using public sources."
arch=('any')
url="https://github.com/laramies/theHarvester"
license=('GPL2')
depends=(
    'python'
    'python-aiodns'
    'python-aiohttp'
    'python-aiomultiprocess'
    'python-aiosqlite'
    'python-beautifulsoup4'
    'python-certifi'
    'python-dnspython'
    'python-netaddr'
    'python-plotly'
    'python-pyppeteer'
    'python-yaml'
    'python-requests'
    'python-retrying'
    'python-shodan'
    'python-texttable'
    'python-lxml'
    'python-uvloop'
)
makedepends=('git' 'python-setuptools' 'python-pytest')
provides=("${pkgname}")
conflicts=("${pkgname}")
install="theHarvester.install"
source=("$pkgname::git+https://github.com/laramies/theHarvester.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}

check() {
    cd "${srcdir}/${pkgname}"
    pytest
}
