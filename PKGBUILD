# Maintainer: defname
pkgname=iwdrofimenu-git
_pkgname=iwdrofimenu
pkgver=r35.bd271f2
pkgrel=1
pkgdesc="A rofi script providing a minimalistic wifi network chooser for iwd"
arch=("any")
url="https://github.com/defname/rofi-iwd-wifi-menu"
license=('GPL3')
depends=("python-pexpect" "python>=3.10" "iwd>=2" "rofi>=1.7" "util-linux>=2.38")
makedepends=("git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=iwdrofimenu.install
changelog=
source=("${_pkgname}::git+https://github.com/defname/rofi-iwd-wifi-menu")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${_pkgname}
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${_pkgname}
    install -d $pkgdir/usr/bin
    PREFIX=$pkgdir/usr make install
    rm $pkgdir/usr/bin/iwdrofimenu
    ln -s /usr/share/$_pkgname/iwdrofimenu.py $pkgdir/usr/bin/iwdrofimenu
}
