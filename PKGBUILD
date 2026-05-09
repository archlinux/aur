# Maintainer: Marcus Bandit <marcusbanditten@gmail.com>
pkgname=anirss-git
_pkgname=anirss
pkgver=0.0.0.r0.0000000
pkgrel=1
pkgdesc="Search nyaa.si and hand the result to qBittorrent (git main)"
arch=('any')
url="https://github.com/marcusbandit/anirss"
license=('GPL-3.0-or-later')
depends=('python' 'fzf')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/marcusbandit/anirss.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # Prefer the latest tag; fall back to a commit-count form on a fresh repo.
    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "0.0.0.r%s.%s" \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$_pkgname"
    install -Dm755 anirss      "$pkgdir/usr/bin/anirss"
    install -Dm644 README.md   "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 LICENSE     "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
