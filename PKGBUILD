# Maintainer: Furkan Baytekin (Elagoht) <furkanbaytekin@gmail.com>
pkgname=img2pdf+
pkgver=r10.8328987
pkgrel=3
pkgdesc='Merge images into one pdf file via command line.'
arch=('any')
url="https://github.com/Elagoht/img2pdf"
license=('GPLv3')
makedepends=('python-pillow' 'pyinstaller' 'python-fpdf2' 'python-magic' 'python-fonttools')
provides=('img2pdf+')
conflicts=('img2pdf' 'img2pdf-git')
source=('git+https://github.com/Elagoht/img2pdf')
sha256sums=('SKIP')
pkgver() {
    cd "$srcdir/img2pdf"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "$srcdir/img2pdf/"
    pyinstaller --onefile img2pdf.py
}
package() {
	install -d "$pkgdir/usr/bin/"
    install -Dm755 "$srcdir/img2pdf/dist/img2pdf" -t "$pkgdir/usr/bin/"
    rm -rf "$srcdir/img2pdf"
}
