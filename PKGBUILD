# Maintainer: Thomas Lübking <thomas.luebking at gmail>

pkgname=sqriptor-git
_gitname=sqriptor
pkgver=r151.c0599eb
pkgrel=1
pkgdesc="QScintilla based text editor"
arch=(i686 x86_64)
url="https://github.com/luebking/sqriptor"
license=(GPL)
depends=(qt6-base qscintilla-qt6)
makedepends=(git)
provides=(sqriptor)
conflicts=(sqriptor)
source=("git+https://github.com/luebking/sqriptor.git")
sha256sums=("SKIP")

pkgver() {
    cd "${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_gitname}"
    qmake6
    make
}

package() {
    cd "${_gitname}"
    install -Dm755 sqriptor -t "${pkgdir}/usr/bin"
    install -Dm644 "sqriptor.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "sqriptor256.png" "${pkgdir}/usr/share/pixmaps/sqriptor.png"
    install -Dm644 "sqriptor.desktop" -t "${pkgdir}/usr/share/applications"
}
