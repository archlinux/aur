# Maintainer: Carson Rueter <roachh@protonmail.com>

_pkgname='gord'
pkgname='gord-git'
pkgdesc='Discord TUI client - Fork of cordless (git releases)'
url="https://github.com/cainy-a/$_pkgname/"
license=('BSD')
pkgver=2021.04.19.r4.g5db229e
pkgrel=1
source=("git+https://github.com/cainy-a/$_pkgname.git")
md5sums=('SKIP')
provides=('gord')
conflicts=('gord-bin')
depends=('glibc')
makedepends=('go' 'git')
arch=('x86_64')

pkgver() {
    cd "$srcdir/$_pkgname"
    ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd $srcdir/$_pkgname
    go build
}

package() {
    cd $srcdir/$_pkgname
    install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

