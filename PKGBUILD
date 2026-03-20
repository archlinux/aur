# Maintainer: Eleanor Kelley <me at eleanorkelley dot com>

_id=io.github.rfrench3
_pkgname=scopebuddy-gui
pkgname=$_pkgname-git
pkgver=v2.4.0.r1.gc3c9504
pkgrel=1
pkgdesc="Graphical frontend for ScopeBuddy"
arch=(any)
url="https://github.com/rfrench3/scopebuddy-gui"
license=('LGPL-3.0-only')
depends=(
    'pyside6'
    'scopebuddy'
)
makedepends=('git')
optdepends=(
    'gamescope: gamescope integration'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/rfrench3/scopebuddy-gui")
b2sums=('SKIP')
pkgver() {
    cd $_pkgname
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
    sed -i -E "s/scopebuddygui|$_id.$_pkgname/$_pkgname/g" $_pkgname/$_id.$_pkgname.desktop
    # Fix icon
    sed -i "/app = QApplication(\[\])/a app.setDesktopFileName(\"$_pkgname\")" $_pkgname/src/main.py
}
package() {
    install -Dm644 "$_pkgname"/src/*.{py,ui} -t "$pkgdir/usr/share/$_pkgname"
    chmod 755 "$pkgdir/usr/share/$_pkgname/main.py"
    install -d "$pkgdir/usr/bin"
    ln -s "/usr/share/$_pkgname/main.py" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$_pkgname/src/img/$_id.$_pkgname.svg" "$pkgdir/usr/share/$_pkgname/$_id.$_pkgname.svg"
    install -Dm644 "$_pkgname/src/img/$_id.$_pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
    install -Dm644 "$_pkgname/src/img/$_id.$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
    install -Dm644 "$_pkgname/$_id.$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
