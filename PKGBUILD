# Maintainer: nano thirteen <nano13@gmx.net>

_pkgname=('kulanday')
pkgname=('kulanday-git')
pkgver=173
pkgrel=1
pkgdesc='A software for collecting and managing datasets for learning languages (or anything else)'
arch=('any')
licence=('gpl')
url='https://tambi-soft.github.io'
makedepends=('git')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'ffmpeg')
source=(${_pkgname}::git+https://github.com/tambi-soft/kulanday.git)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir"/"$_pkgname"
    qmake-qt5 -o Makefile kulanday.pro
    make
    make clean
}

package() {
    install -D -m 755 ${srcdir}/${_pkgname}/debug/kulanday ${pkgdir}/usr/bin/kulanday
    install -D -m 644 ${srcdir}/${_pkgname}/assets/logo.ico ${pkgdir}/usr/share/icons/hicolor/128x128/apps/kulanday_logo.ico
    install -D -m 644 ${srcdir}/${_pkgname}/assets/kulanday.desktop ${pkgdir}/usr/share/applications/kulanday.desktop
}
