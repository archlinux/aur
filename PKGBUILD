# Maintainer: Senderman <doletov.fyodor@yandex.ru>
pkgname=nvidia-system-monitor-qt
pkgver=1.1
pkgrel=2
pkgdesc="Task Manager for Linux for Nvidia graphics cards (QT vesrion)"
arch=('x86_64')
url="https://github.com/congard/${pkgname}"
license=('MIT')
depends=('nvidia-utils' 'qt5-base' 'which')
makedepends=('cmake')
source=("${pkgname}::https://github.com/congard/nvidia-system-monitor-qt/archive/v${pkgver}.tar.gz" "${pkgname}.desktop")
md5sums=('SKIP' 'SKIP')


build() {
    cd $srcdir/${pkgname}-${pkgver}
    mkdir build
    cmake -B build -DDistributive=Arch -G "Unix Makefiles"
    cmake --build build --target qnvsm -- -j 2
}

package() {
    cd $srcdir/${pkgname}-${pkgver}
    install -Dm0644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
    install -Dm0755 build/qnvsm $pkgdir/usr/bin/qnvsm
    install -Dm0644 icon.png $pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname}.png
    install -Dm0755 ${srcdir}/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}
