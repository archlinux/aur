# Maintainer: jakob <grandchild@gmx.net>

_pkgname=git-backdate
pkgname=${_pkgname}-git
pkgver=r30.8ba5a0e
pkgrel=1
pkgdesc="Backdate a commit or range of commit to a date or range of dates"
arch=(any)
url="https://github.com/rixx/git-backdate"
license=(custom)
depends=(python sed)
source=("git+https://github.com/rixx/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "$_pkgname"
    install -Dm755 git-backdate "$pkgdir/usr/bin/git-backdate"
    install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
