# Maintainer: Furkan Baytekin (Elagoht) <furkanbaytekin@gmail.com>
pkgname=img2pdf+
pkgver=r9.ab48089
pkgrel=1
pkgdesc="Merge images into one pdf file via command line."
arch=("any")
url="https://github.com/Elagoht/img2pdf"
license=('GPLv3')
makedepends=("python" "python-pip")
provides=("img2pdf")
conflicts=("img2pdf" "img2pdf-git")
replaces=("img2pdf" "img2pdf-git")
source=("git+https://github.com/Elagoht/img2pdf")
sha256sums=("SKIP")
pkgver() {
    cd "$srcdir/img2pdf"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
    cd "$srcdir/img2pdf/"
    python3 -m venv builder
    source builder/bin/activate
    pip install pillow python-magic fpdf2 pyinstaller
}
build() {
    cd "$srcdir/img2pdf/"
    python -m PyInstaller --onefile img2pdf.py
}
package() {
	install -d "$pkgdir/usr/bin/"
    install -Dm755 "$srcdir/img2pdf/dist/img2pdf" -t "$pkgdir/usr/bin/"
    rm -rf "$srcdir/img2pdf"
}

