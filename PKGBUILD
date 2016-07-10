# Maintainer: Salamandar <felix@piedallu.me>
pkgname='vlsub-git'
_gitname='vlsub'
pkgver=0.9.13.r29.f33769f
pkgrel=1
pkgdesc="VLC extension to download subtitles from opensubtitles.org"
arch=('any')
url="https://github.com/exebetche/$_gitname"
license=('GPL')
groups=()
makedepends=('git')
depends=('bash' 'pkgbuild-introspection' 'pacman' 'namcap')
source=("git+$url.git")
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
    install -Dm644 vlsub.lua ${pkgdir}/usr/lib/vlc/lua/extensions/vlsub/vlsub.lua
    install -dm644           ${pkgdir}/usr/lib/vlc/lua/extensions/vlsub/locale
    cp locale/*              ${pkgdir}/usr/lib/vlc/lua/extensions/vlsub/locale

}
