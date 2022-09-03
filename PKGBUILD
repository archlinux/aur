# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=normcap
pkgver=0.3.11
pkgrel=1
pkgdesc="OCR powered screen-capture tool to capture information instead of images"
arch=('any')
url="https://dynobo.github.io/normcap"
license=('GPL')
depends=('leptonica' 'pyside6' 'python-pytesseract' 'wl-clipboard')
makedepends=('python-pip' 'python-poetry')
#checkdepends=('python-certifi' 'python-levenshtein' 'python-pydocstyle' 'python-pytest-cov' 'python-toml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dynobo/normcap/archive/refs/tags/v$pkgver.tar.gz"
#        "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('4f51dd5e277021262b6a9a8fe4bca9a6d7351a092022782c62e6d06cd8871b83'
            '29992fdb19773faa7582e44fe4394d4772984d5b7b9b7b347617c387f0a260f9')

build() {
  cd "$pkgname-$pkgver"
  poetry build --format wheel
}

#check() {
#  cd "$pkgname-$pkgver"
#  poetry run pydocstyle
#  poetry run pytest -vv -m "not skip_on_gh" --cov --cov-report=xml
#}

package() {
  cd "$pkgname-$pkgver"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl

  install -Dm644 "assets/icons/$pkgname.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
