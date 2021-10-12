pkgname=qarma-git
pkgver=72.605ea42
pkgrel=1
pkgdesc="A drop-in replacement clone for zenity, written in Qt, Qt5 build"
arch=('i686' 'x86_64')
url="https://github.com/luebking/qarma"
license=('GPL')
depends=('qt5-base' 'qt5-x11extras')
makedepends=('git')
provides=('qarma' 'zenity')
conflicts=('qarma' 'zenity')
source=("git+https://github.com/luebking/qarma")
md5sums=("SKIP")

pkgver() {
    cd "${srcdir}/${pkgname/-git/}"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname/-git/}"
    qmake-qt5
    make
}

package() {
    cd "${srcdir}/${pkgname/-git/}"
    install -Dm755 qarma -t "$pkgdir/usr/bin"
    ln -s /usr/bin/qarma "$pkgdir/usr/bin/qarma-askpass"
    ln -s /usr/bin/qarma "$pkgdir/usr/bin/zenity"
}
