# Maintainer: Falko Galperin <dr (dot) asasteghof (at) gmail (dot) com>
pkgname=python-pdfplumber
pkgver=0.11.7
pkgrel=1
pkgdesc="Plumb a PDF for detailed information about each char, rectangle, line, et cetera."
arch=(any)
url="https://github.com/jsvine/pdfplumber"
license=('MIT')
# See `prepare()` for why we use >= rather than == for python-pdfminer here.
depends=('python>=3.8.0' 'python-pdfminer>=20250506' 'python-pillow>=9.1.0' 'python-pypdfium2>=4.18.0')
makedepends=('python-setuptools')
changelog=$pkgname.changelog.md
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("fa67773e5e599de1624255e9b75d1409297c5e1d7493b386ce63648637c67368")

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
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
