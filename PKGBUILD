# Maintainer: neodarz <neodarz@neodarz.net>
# Contributor: neodarz <neodarz@neodarz.net>

pkgbase=has-git
pkgname=has-git
_pkgname=has
pkgver=r70.5443d4c
pkgrel=1
pkgdesc="checks presence of various command line tools and their versions on the path "
arch=('i686' 'x86_64')
url="https://github.com/kdabir/$_pkgname"
license=('Apache')
makedepends=(git make gcc imagemagick)
provides=("$_pkgname" "has")
conflicts=("$_pkgname" "has")
source=("$pkgname"::"git+https://github.com/kdabir/$_pkgname.git")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 has "$pkgdir/usr/local/bin/has"
}
