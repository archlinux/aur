# Maintainer: osakasys <dragos240alt@gmail.com>

_pkgname='mi-create'
pkgname="$_pkgname-git"
# pkgver=v1.1.r72.gb8d30a6
pkgrel=1
pkgdesc="Unofficial watchface creator for Xiaomi wearables ~2021 and above"
arch=('x86_64')
url='https://github.com/ooflet/Mi-Create'
license=('GPL-3.0-or-later')
conflicts=("$_pkgname")
provides=("$_pkgname")
depends=('python' 'python-pyqt6' 'python-qscintilla-qt6' 'python-beautifulsoup4' 'python-pillow'
         'python-lxml' 'python-xmltodict' 'python-requests')
source=("$_pkgname::git+https://github.com/ooflet/Mi-Create.git#branch=next"
        "$_pkgname.sh"
        "$_pkgname.desktop")
sha256sums=('SKIP'
            'caaaddaf94046d8c5850339bfdec5a939b7c6199d906cb5b1b82f3ca4185f1c7'
            'c08eb2c9655796c5b8db829c8c7fae3c1a94dca7851e0b5a2e5e212490684a4f')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$_pkgname"

    install -dm0755 "$pkgdir/opt/$_pkgname"
    cp -r * "$pkgdir/opt/$_pkgname/"

    install -Dm0755 "$srcdir/$_pkgname.sh" -T "$pkgdir/usr/bin/$_pkgname"
    install -Dm0644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm0644 'src/resources/MiCreate128x128.png' -t "$pkgdir/usr/share/icons/hicolor/128x128/apps"
}
