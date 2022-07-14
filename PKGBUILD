# Maintainer: Henri van de Munt <(firstname) @ gmail.com>
# Contributor: j.r <j.r@jugendhacker.de>
pkgname=gnome-shell-extension-material-shell-git
pkgver=r931.8e6c6e3
pkgrel=1
epoch=1
pkgdesc="GNOME Shell Extension Material Shell"
arch=('any')
url="https://github.com/PapyElGringo/material-shell"
license=('GPL')
depends=('gnome-shell')
makedepends=('git' 'npm')
optdepends=('plata-theme: gtk and shell theme'
            'tela-icon-theme-git: icon theme'
            'ttf-roboto: font')
groups=('gnome-shell-extensions')
source=('git+https://github.com/PapyElGringo/material-shell.git')
md5sums=('SKIP')

pkgver() {
    cd material-shell
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
