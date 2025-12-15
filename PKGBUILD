# Maintainer: initMayday <initMayday@protonmail.com>

_pkgname="declarages"
pkgname="$_pkgname"
pkgrel=1
pkgver=v1.0.0
pkgdesc='A way to manage your packages in lua'
arch=('any')
url='https://github.com/initMayday/declarages.git'
makedepends=('git')
depends=('lua' 'luarocks')
optdepends=('git: pacman core'
            'pacman-contrib: pacman core'
            'flatpak: flatpak core'
            'nix: nix core')
provides=("$_pkgname")
conflicts=("$_pkgname")
license=('AGPL-3.0-or-later')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --tags --abbrev=0
}

prepare() {
    cd "$_pkgname"
    git checkout "$(git describe --tags --abbrev=0)"
}

package() {
    cd "$_pkgname"
    ./$pkgdir/deps.sh
    install -Dm755 ./wrapper.sh "$pkgdir/usr/bin/$_pkgname"
    mkdir -p "$pkgdir/usr/share/$_pkgname"
    cp -rf ./* "$pkgdir/usr/share/$_pkgname/"
}
