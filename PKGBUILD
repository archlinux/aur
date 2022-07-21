# Maintainer: Falko Galperin <dr (dot) asasteghof (at) gmail (dot) com>
pkgname=python-pdfplumber
pkgver=0.7.4
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
sha256sums=("f0f29488a3228696d66e7ddedeb85dc44d65cc32a7e9ea3728f7fbce9dd07b71")

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
