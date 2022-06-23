# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Daniel Peukert <daniel@peukert.cc>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_projectname='beautifulsoup4'
pkgname="python2-$_projectname"
pkgver='4.9.3'
pkgrel='5'
pkgdesc='A Python HTML/XML parser designed for quick turnaround projects like screen-scraping - python2 version'
arch=('any')
url="https://www.crummy.com/software/BeautifulSoup/index.html"
license=('PSF')
depends=('python2-soupsieve')
optdepends=(
    'python2-chardet: to autodetect character encodings'
    'python2-lxml: alternative HTML parser'
    'python2-html5lib: alternative HTML parser'
)
makedepends=('python2-setuptools' 'python2-soupsieve')
checkdepends=('python2-pytest')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://pypi.io/packages/source/b/$_projectname/$_projectname-$pkgver.tar.gz")
sha256sums=('84729e322ad1d5b4d25f805bfa05b902dd96450f43842c4e99067d5e1369eb25')

_sourcedirectory="$_projectname-$pkgver"

build() {
    cd "$srcdir/$_sourcedirectory/"
    python2 setup.py build
}

check() {
    cd "$srcdir/$_sourcedirectory/build/"
    py.test2
}

package() {
    cd "$srcdir/$_sourcedirectory/"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
