# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Maintainer: Pig Monkey <pm@pig-monkey.com>
# Contributor: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>

pkgname=ocrmypdf
pkgver=17.14.1
pkgrel=1
pkgdesc="A tool to add an OCR text layer to scanned PDF files, allowing them to be searched"
url="https://github.com/ocrmypdf/OCRmyPDF"
arch=('any')
license=(MPL2)
# NOTICE: The number of dependencies we rely on is *very high*. If the program does not run after an upgrade, make sure all your deps are upgraded, especially AUR deps!
depends=('python>=3.9' 'img2pdf' 'python-pillow' 'tesseract' 'ghostscript' 'unpaper' 'pngquant' 'python-pikepdf>=10.15' 'python-reportlab' 'python-pdfminer' 'python-tqdm' 'python-pluggy' 'python-rich' 'python-importlib_resources' 'python-packaging' 'python-deprecation' 'python-pydantic' 'python-uharfbuzz' 'python-fpdf2')

makedepends=('python-hatch-vcs' 'python-build' 'python-installer' 'python-wheel')
optdepends=('jbig2enc: Better compression algorithm; results in smaller PDF files' 'python-pillow-heif: HEIF/HEIC image support')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('77412e62f621f1d1dbf4a333b4ef76c7f70977b1cb2d1d1f2d8d1e85939c0bf7')
install="${pkgname}.install"

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
