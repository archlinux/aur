# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=git-hooks-git
_gitname=git-hooks
pkgver=1.00.0.r9.g3b89627
pkgrel=1
pkgdesc="A tool to manage project, user, and global Git hooks for multiple git repositories."
arch=(any)
url="https://github.com/icefox/git-hooks"
license=(BSD)
depends=(git)
makedepends=(git)
provides=(git-hooks)
conflicts=(git-hooks)
source=(git+https://github.com/icefox/git-hooks)
md5sums=(SKIP)

pkgver() {
    cd "$_gitname"
    git describe --long --tags | \
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_gitname"
    install -D git-hooks "$pkgdir"/usr/bin/git-hooks
    install -D README.md "$pkgdir"/usr/share/doc/git-hooks/README.md
    install -D LICENSE "$pkgdir"/usr/share/licenses/git-hooks-git/LICENSE

    mkdir -p "$pkgdir"/usr/share/git-hooks
    install-hooks-from git_hooks
    install-hooks-from contrib
}

install-hooks-from() {
    pushd "$1"
    find -type f -exec install -D {} "$pkgdir"/usr/share/git-hooks/{} \;
    popd
}
