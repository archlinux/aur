# Maintainer: Senderman <doletov.fyodor@yandex.ru>
pkgname=nvidia-system-monitor-git
_pkgname=nvidia-system-monitor
pkgver=v1.0
pkgrel=2
pkgdesc="Task Manager for Linux for Nvidia graphics cards"
arch=('x86_64')
url="https://github.com/congard/${_pkgname}"
license=('MIT')
depends=('nvidia-utils' 'wxgtk3' 'which')
makedepends=('wxgtk2')
source=("${_pkgname}::git+https://github.com/congard/${_pkgname}.git" "${_pkgname}.desktop")
md5sums=('SKIP' 'SKIP')


build() {
    cd $srcdir/${_pkgname}
    ./make.sh install-build
}

package() {
    cd $srcdir/${_pkgname}
    install -Dm0644 LICENSE $pkgdir/usr/share/licenses/${_pkgname}/LICENSE
    install -Dm0755 bin/${_pkgname} $pkgdir/usr/bin/${_pkgname}
    install -Dm0755 $srcdir/${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop
    install -Dm0644 icon.png $pkgdir/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png
    install -Dm0644 src/html/nvsm128.png $pkgdir/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png
    mkdir -p $pkgdir/usr/share/doc/${_pkgname}
    cp -ar src/html $pkgdir/usr/share/doc/${_pkgname}
}
