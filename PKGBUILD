# Maintainer: Raj-Jagadeesh-A-P <rajjagadeesh2006@gmail.com>
pkgname=aino
pkgver=0.1.0
pkgrel=1
pkgdesc="Offline all-in-one CLI converter for PDF, images, documents and OCR"
arch=('any')
url="https://github.com/Raj-Jagadeesh-A-P/aino"
license=('GPL-3.0-or-later')
depends=('python' 'poppler' 'qpdf' 'imagemagick')
optdepends=(
  'img2pdf: lossless image to PDF'
  'ghostscript: PDF compression and PDF/A'
  'libreoffice-fresh: Office to/from PDF'
  'python-pdf2docx: higher fidelity PDF to DOCX (AUR)'
  'tesseract: OCR'
  'ocrmypdf: higher quality PDF OCR'
  'pandoc-cli: Markdown/HTML/text to PDF'
  'typst: default PDF engine for pandoc'
)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('af2c410c23bc554de7ff82c1af3a8b9913d8ebf57d5e3ff40614f885f0ce3ec3')

package() {
  cd "$srcdir/aino-$pkgver"

  install -Dm755 aino.py "$pkgdir/usr/bin/aino"
  install -d "$pkgdir/usr/lib"
  cp -r aino "$pkgdir/usr/lib/aino"
  find "$pkgdir/usr/lib/aino" -type d -name __pycache__ -exec rm -rf {} +

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 completions/aino.bash "$pkgdir/usr/share/bash-completion/completions/aino"
  install -Dm644 completions/aino.zsh "$pkgdir/usr/share/zsh/site-functions/_aino"
  install -Dm644 man/aino.1 "$pkgdir/usr/share/man/man1/aino.1"
}
