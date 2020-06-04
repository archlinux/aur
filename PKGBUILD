# Maintainer: Pi-Yueh Chuang <pychuang@pm.me>
pkgname=mdpreview-git
pkgver=r79.576dacb
pkgrel=1
pkgdesc="A simple QT-based Markdown previewer, designed to be used with an external editor"
arch=("x86_64")
url="https://github.com/fboender/mdpreview"
license=("GPL3")
depends=("python-pyqt5" "python-markdown" "python-pyinotify" "python-markdown-checklist-git")
makedepends=("git")
provides=("mdpreview")
source=("git+https://github.com/fboender/mdpreview.git")
sha256sums=("SKIP")

# for convenience
_pkgname=mdpreview

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

    # use the original installation script
    cd "$_pkgname"
    chmod +x ./install.sh
    INSTALL_PATH=$pkgdir/usr ./install.sh

    # fix link
    rm "$pkgdir/usr/bin/mdpreview"
    ln -s /usr/lib/mdpreview/mdpreview "$pkgdir/usr/bin"

    # install license file
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
