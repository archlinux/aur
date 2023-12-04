# shellcheck disable=SC2034,SC2154
# - SC2034 - appears unused.
# - SC2154 - pkgdir is referenced but not assigned.

# Maintainer: Azat Khuzhin <a3at.mail@gmail.com>
pkgname=chdig-git
pkgver=v0.4.0.r31.g0bf05ba
pkgrel=1
pkgdesc="Dig into ClickHouse with TUI interface"
arch=('x86_64')
depends=('bash')
makedepends=('git' 'rust' 'pyoxidizer' 'python')
conflicts=("chdig")
provides=("chdig")
url="https://github.com/azat/chdig"
license=('MIT')
source=(
    "$pkgname::git+$url"
)
sha256sums=(
    'SKIP'
)

# Some of this may have fortify sources of whatever this could break musl build
CFLAGS=
CXXFLAGS=
LDFLAGS=
LTOFLAGS=

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    make build build_completion
}

package() {
    cd $srcdir/$pkgname
    make install DESTDIR="$pkgdir/usr"
}
# vim set: ts=4 sw=4 et
