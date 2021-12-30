# Maintainer: Philipp Kühn <p dot kuehn at posteo dot de>
pkgname=sane-scan-pdf-git
pkgver=20211022
pkgrel=1
pkgdesc="Sane scanning bash script with OCR and deskew support."
arch=('any')
license=('GPL3')
provides=('sane-scan-pdf')
url="https://github.com/rocketraman/sane-scan-pdf"
depends=('bash' 'netpbm' 'ghostscript' 'poppler' 'units' 'imagemagick')
optdepends=('unpaper: for software deskew'
		    'util-linux: for properly ordered verbose logs'
		    'tesseract: to make searchable PDFs'
		    'parallel: to constrain resource usage during page processing'
		    'bc: whitepage detection percentage calculations')
makedepends=('git')
source=("$pkgname::git+https://github.com/rocketraman/sane-scan-pdf")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/sane-scan-pdf-git"
	git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
	cd "$pkgname"
	install -Dm755 -t "$pkgdir/usr/bin" scan scan_perpage
}
