# Maintainer: xkero <sinister.ray@gmail.com>
pkgname="quickgrab-git"
pkgver=r20.f3bd86c
pkgrel=1
pkgdesc="A simple GUI screenshot utility with direct access to OCR and QR code/barcode decoding."
arch=('any')
url="https://github.com/xkero/quickgrab"
license=('GPL-3.0-or-later')
groups=()
depends=('python' 'pyside6' 'grim')
optdepends=(
	'tesseract: OCR function'
	'zbar: QR & barcode decoding'
)
makedepends=('git')
source=("${pkgname}::git+https://github.com/xkero/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dt "${pkgdir}/usr/share/quickgrab" main.py ui.qml
	install -d "${pkgdir}/usr/bin"
	ln -s /usr/share/quickgrab/main.py "${pkgdir}/usr/bin/quickgrab"
}
