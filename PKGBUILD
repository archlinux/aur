# Maintainer: Felix Schindler <aut at felixschindler dot net>

pkgname=ocr4linux-x11
PKGNAME=OCR4Linux
pkgver=1.3.0
pkgrel=0
pkgdesc="A versatile text extraction tool to extract text from a screenshot of a selected area OCR, and copy it to the clipboard (X11)."
arch=('x86_64')
url="https://github.com/moheladwy/OCR4Linux"
license=('MIT')
depends=(
	'bash'
	'tesseract'
        'python'
        'python-numpy'
        'python-pillow'
        'python-pytesseract'
        'python-opencv'
        # X11
        'xclip'
        'scrot'
        'rofi'
)
source=("https://github.com/moheladwy/OCR4Linux/archive/refs/tags/v${pkgver}.tar.gz"
	'01-fix-directories.patch')
sha256sums=('3b202fddf3d5f184ac6176e4137a520e1072221f34fc735e38adbad5166e7686'
            '7fe530e59f52b8da64a2ad24e85032245bf20b3bac23b963f4af11e3c5149155')

build() {
	cd "${srcdir}/${PKGNAME}-${pkgver}"
	patch -p1 < ../01-fix-directories.patch
}

package() {
	cd "${srcdir}/${PKGNAME}-${pkgver}"
	for ii in py sh; do
		install -D -m 755 "${srcdir}/${PKGNAME}-${pkgver}/${PKGNAME}.${ii}" "${pkgdir}/usr/bin/${PKGNAME}.${ii}"
	done
}

