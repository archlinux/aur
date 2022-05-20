# Maintainer: André Laszlo <andre@laszlo.nu>

# Follow the development of this package on GitHub:
# https://github.com/andrelaszlo/aur-occulitist

pkgname=occultist-git
pkgver=r49.6e9d5f4
pkgrel=1
pkgdesc="The Chaos programming language dependency manager"
url="https://occultist.io/"
license=('GPL3')
arch=('i686' 'x86_64')
source=("occultist-git::git+https://github.com/chaos-lang/occultist.git#branch=master")
md5sums=('SKIP')
depends=('jq' 'git' 'bash')

pkgver() {
    cd "$pkgname"
    # Since there are no tags: use number of revisions since beginning of the history.
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir"
    git --git-dir="../occultist-git" --work-tree="." checkout master occultist.sh
    install -Dm 755 "$srcdir/occultist.sh" "$pkgdir/usr/bin/occultist"
}

