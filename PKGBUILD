# Maintainer: Falko Galperin <dr (dot) asasteghof (at) gmail (dot) com>
pkgname=python-pdfplumber
pkgver=0.7.0
pkgrel=1
pkgdesc="Plumb a PDF for detailed information about each char, rectangle, line, et cetera."
arch=(any)
url="https://github.com/jsvine/pdfplumber"
license=('MIT')
depends=('python>=3.7.0' 'python-pdfminer>=20220524' 'python-pillow>=9.1.0' 'python-wand>=0.6.7')
makedepends=('python-setuptools')
changelog=$pkgname.changelog.md
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("152a8a989080e4be6b442c9650145040864eb5baf8a148d2a268095255559be8")

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
