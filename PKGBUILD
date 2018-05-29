# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=tvlinker
pkgver=4.2.0
_branch=master
pkgrel=2
pkgdesc="TV show link scraper + downloader for Scene-RLS.com w/ debrid link unrestricting and support for a number of download managers across all platforms + ShadowSocks & v2ray local proxies."
arch=('any')
license=('GPL3')
url="https://tvlinker.ozmartians.com"
source=(https://github.com/ozmartian/${pkgname}/archive/${_branch}.tar.gz)
depends=('nodejs' 'python-beautifulsoup4' 'python-lxml' 'python-pyqt5' 'python-requests' 'python-setuptools')
makedepends=('python-setuptools')
optdepends=('aria2' 'persepolis' 'pyload' 'python-pysocks')
md5sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}-${_branch}"
    sed -i "s/pypi/arch/" "${pkgname}/__init__.py"
}

build() {
    cd "${srcdir}/${pkgname}-${_branch}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${_branch}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
