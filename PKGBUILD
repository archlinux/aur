# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

_pkgname=cross-install
pkgname=$_pkgname-git
pkgver=1.2.0.r7.gf9c1bad
pkgrel=1
pkgdesc='POSIX-complient cross-platform install command'
arch=('any')
url='https://gitlab.com/stefanwimmer128/cross-install'
license=('MPL2')
depends=('sh')
makedepends=('git' 'getoptions' 'moreutils')
checkdepends=('shellcheck')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://gitlab.com/stefanwimmer128/cross-install.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"

    make
}

check() {
    cd "$_pkgname"

    make check
}

package() {
    cd "$_pkgname"

    make DESTDIR="$pkgdir" PREFIX=/usr install
}
