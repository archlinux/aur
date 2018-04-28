# Maintainer: Tim Wanders <timwanders241@gmail.com>
_pkgname=pacman-src
pkgname=pacman-src-git
pkgver=05190a8
pkgrel=1
pkgdesc="pacman-src: A simple tool to compile packages from source using the ABS"
arch=('any')
url="https://github.com/tim241/${_pkgname}"
license=('GPL3')

provides=('pacman-src')
conflicts=('pacman-src')
depends=('bash'	'pacman' 'git')
makedepends=('help2man')

source=("git://github.com/tim241/${_pkgname}.git")

sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --always | sed -e 's|-|.|g'
}

build() {
    cd "$_pkgname"
    # Fix incorrectly generating man page
    export _system_config_file="src/conf/pacman-src.conf"
    make VERSION="$pkgver-git" -j1
    unset  _system_config_file
}

package() {
    cd "$_pkgname"
    make install prefix="/usr/" DESTDIR="$pkgdir" -j1
}
