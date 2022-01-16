# Maintainer: Chrys <mail@chrys.de>
# Contributor: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgname=ocrdesktop-git
pkgver=3.0.r0.g196a287
pkgrel=2
pkgdesc="OCR the current window or desktop and make it browsable for the user (development version)"
arch=('any')
url="http://www.crivatec.de"
license=('GPL')
depends=('libwnck3' 'python-atspi' 'python-pillow' 'python-pytesseract' 'tesseract-data-eng')
makedepends=('git')

optdepends=(
'python-webcolors: For color analyzing support'
'python-scipy: For color analyzing support'
'python-pdf2image: for PDF support'
)

source=("git+https://github.com/chrys87/ocrdesktop.git")
install='ocrdesktop.install'
provides=('ocrdesktop')
conflicts=('ocrdesktop')
md5sums=("SKIP")

pkgver() {
 cd "${pkgname%-git}"
 # cutting off 'v' prefix that presents in the git tag
 git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/_/-/g;s/-/./g'
}

package() {
 cd ocrdesktop
  install -Dm755 ocrdesktop "$pkgdir/usr/bin/ocrdesktop"
  install -Dm644 ocrdesktop.1.gz "${pkgdir}/usr/share/man/man1/ocrdesktop.1.gz"
}
