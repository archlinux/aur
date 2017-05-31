_username=ned14
_reponame=boost.outcome
_repoaddr="https://github.com/$_username/$_reponame"
pkgname=boost.outcome-git
pkgver=r1019.4851926
pkgrel=1
pkgdesc="Utilities for modern error reporting and propagation in C++ applications"
url=$_repoaddr
license=('boost')
depends=('boost')
arch=('i686' 'x86_64')
source=("git+$_repoaddr.git")
sha256sums=('SKIP')

pkgver() {
    _repodir="$srcdir/$_reponame"

    cd "$_repodir"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    _repodir="$srcdir/$_reponame"

    install -d $pkgdir/usr/include
    cp -r $_repodir/include $pkgdir/usr
}
