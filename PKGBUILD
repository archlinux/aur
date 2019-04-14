# Maintainer: coderbaka <coderbaka@gmail.com>
_pkgname=stcflash
pkgname="$_pkgname-git"
pkgver=r34.791d246
pkgrel=1
pkgdesc="A command line programmer for STC 8051 microcontroller."
arch=('any')
url="https://github.com/laborer/stcflash"
license=('GPL')
depends=('python-pyserial')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/laborer/stcflash.git")
md5sums=('SKIP')
pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}
build() {
    cd "$_pkgname"

    chmod +x stcflash.py
}
package() {
    cd "$_pkgname"

    mkdir -p "$pkgdir/usr/bin"
    cp stcflash.py "$pkgdir/usr/bin/stcflash"
}
