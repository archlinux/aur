# Maintainer: Senderman <doletov.fyodor@yandex.ru>
pkgname=nvidia-system-monitor-qt
pkgver=1.0
pkgrel=1
pkgdesc="Task Manager for Linux for Nvidia graphics cards (QT vesrion)"
arch=('x86_64')
url="https://github.com/congard/${pkgname}"
license=('MIT')
depends=('nvidia-utils' 'qt5-base')
source=("${pkgname}::https://github.com/congard/nvidia-system-monitor-qt/archive/v1.0.tar.gz" "${pkgname}.desktop")
md5sums=('SKIP' 'SKIP')


build() {
    cd $srcdir/${pkgname}-${pkgver}
    qmake qnvsm.pro
    make
}

package() {
    cd $srcdir/${pkgname}-${pkgver}
    install -Dm0644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
    install -Dm0755 build/qnvsm $pkgdir/usr/bin/qnvsm
    install -Dm0644 icon.png $pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname}.png
    install -Dm0755 ${srcdir}/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}
