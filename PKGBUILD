_username=ptal
_reponame=expected
pkgname=boost.expected-git
pkgver=r341.2d1babd
pkgrel=1
pkgdesc="Utility class to represent expected monad"
url="https://github.com/ptal/expected"
license=('boost')
depends=('boost')
arch=('i686' 'x86_64')
source=("git+https://github.com/$_username/$_reponame.git")
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
