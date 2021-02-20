# Maintainer: Henri van de Munt <(firstname) @ gmail.com>
pkgname=gnome-shell-extension-material-shell-git
pkgver=12.r12.a216007
pkgrel=1
pkgdesc="GNOME Shell Extension Material Shell"
arch=('any')
url="https://github.com/PapyElGringo/material-shell"
license=('GPL')
depends=('gnome-shell')
makedepends=('git' 'npm' 'python2')
optdepends=('plata-theme: gtk and shell theme'
            'tela-icon-theme-git: icon theme'
            'ttf-roboto: font')
groups=('gnome-shell-extensions')
source=('git+https://github.com/PapyElGringo/material-shell.git')
md5sums=('SKIP')

pkgver() {
    cd material-shell
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd material-shell
    npm install --cache "${srcdir}/npm-cache"
    make compile
}

package() {
    cd material-shell
    install -d $pkgdir/usr/share/gnome-shell/extensions/material-shell@papyelgringo/
    cp -r dist/* $pkgdir/usr/share/gnome-shell/extensions/material-shell@papyelgringo/
}
