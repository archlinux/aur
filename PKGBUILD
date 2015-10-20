# Maintainer: Salamandar <felix@piedallu.me>
pkgname='aur-updater-git'
_gitname='aur-updater'
pkgver=r5.f9f88f9
pkgrel=1
pkgdesc="Easy tool to update your PKGBUILDS and update the AUR database automatically"
arch=('any')
url="https://github.com/Salamandar/$_gitname.git"
license=('GPL')
groups=()
makedepends=('git')
depends=('bash' 'pkgbuild-introspection' 'pacman' 'namcap')
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

    install -d $pkgdir/usr/bin/
    chmod +x ./aur-updater.sh
    cp ./aur-updater.sh     "$pkgdir/usr/bin"

    install -d $pkgdir/etc
    cp ./aur-updater.conf   "$pkgdir/etc"
}
