# Maintainer: ocelot <amitchell AT airmail DOT cc>
pkgbase=python-theharvester-git
pkgname=python-theharvester-git
pkgver=3.0.6.r424.g838892e
pkgrel=1
pkgdesc="A tool for gathering e-mail accounts, subdomain names, virtual hosts, open ports/ banners, and employee names from different public sources (search engines, pgp key servers)."
arch=('any')
url="https://github.com/laramies/theHarvester"
license=('GPL2')
depends=(
	'python'
	'python-yaml'
	'python-requests'
	'python-plotly'
	'python-pytest'
	'python-texttable'
	'python-shodan'
	'python-beautifulsoup4'
	'python-yaml'
	'python-decorator'
	'python-censys'
)
makedepends=('git' 'python-setuptools')
provides=("${pkgname}")
conflicts=("${pkgname}")
install="theHarvester.install"
source=("$pkgname::git+https://github.com/laramies/theHarvester.git")
md5sums=('SKIP')

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

check(){
	cd "$srcdir"
	pytest
}
