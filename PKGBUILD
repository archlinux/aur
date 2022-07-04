# Maintainer: Salamandar <felix@piedallu.me>
# Contributor: Bastien "neitsab" Traverse <firstname at lastname dot email>

pkgname=vlsub-git
pkgver=0.10.2.r26.g3d1998f
pkgrel=1
pkgdesc="VLC extension to download subtitles from opensubtitles.org"
arch=('any')
url="https://github.com/exebetche/${pkgname%-git}"
license=('GPL')
depends=('vlc')
makedepends=('git')
provides=('vlsub')
conflicts=('vlsub')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm644 vlsub.lua ${pkgdir}/usr/lib/vlc/lua/extensions/vlsub.lua
    for i in locale/*.xml; do
        install -Dm644 "$i" "${pkgdir}/usr/lib/vlc/lua/extensions/vlsub/$i"
    done
    install -Dm644 README.md "${pkgdir}/usr/share/${pkgname%-git}/README"
}

