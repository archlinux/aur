# Maintainer: Falko Galperin <dr (dot) asasteghof (at) gmail (dot) com>
pkgname=python-pdfplumber
pkgver=0.9.0
pkgrel=1
pkgdesc="Plumb a PDF for detailed information about each char, rectangle, line, et cetera."
arch=(any)
url="https://github.com/jsvine/pdfplumber"
license=('MIT')
# See `prepare()` for why we use >= rather than == for python-pdfminer here.
depends=('python>=3.7.0' 'python-pdfminer>=20221105' 'python-pillow>=9.1.0' 'python-wand>=0.6.10')
makedepends=('python-setuptools')
changelog=$pkgname.changelog.md
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("a43a213e125ed72b2358c0d3428f9b72f83939109ec33b77ef9325eeab9846f0")

prepare() {
    # Somewhat of an ugly hack, but see here: https://aur.archlinux.org/packages/python-pdfplumber#comment-864370
    sed -i 's/pdfminer.six==/pdfminer.six>=/' "$_name-$pkgver/requirements.txt"
}

build() {
    cd "$_name-$pkgver/"
    python setup.py build
}

package() {
    cd "$_name-$pkgver/"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
