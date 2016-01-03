# Maintainer: Salamandar <felix@piedallu.me>
# Contributor: mdsitton <matthewsitton@gmail.com>
pkgname='python2-fretwork-git'
_gitname='fretwork'
pkgver=0.2.0.r1.8d110d7
pkgrel=1
pkgdesc=" Shared code for FoFiX and FoF:R"
arch=('any')
url="https://github.com/fofix/$_gitname.git"
license=('GPL')
groups=('games')
makedepends=('git' 'python2')
depends=()
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    printf "%s.%s" "$( set -o pipefail
        git describe --long --tags 2>/dev/null \
            | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
            | sed -r 's/.([0-9,a-g,A-G]{7}.*)//' ||
        printf "r%s" "$(git rev-list --count HEAD)"
    )" "$(git rev-parse --short HEAD)"
}


package() {
    cd "$srcdir/$_gitname"
    python2 setup.py install --root="$pkgdir"

}
