# Maintainer: Choi Madeleine <gankiann.niu@gmail.com>
pkgname=vlsub-opensubtitles-com-git
pkgver=v1.2.2.r2.geca46ef
pkgrel=1
pkgdesc="VLC extension for downloading subtitles from OpenSubtitles.com"
arch=('x86_64')
url="https://github.com/opensubtitles/${pkgname%-git}"
license=('GPL')
depends=('vlc')
makedepends=('git')
conflicts=('vlsub-git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -dm755 "${pkgdir}/usr/lib/vlc/lua/extensions"
    install -Dm644 vlsubcom.lua "${pkgdir}/usr/lib/vlc/lua/extensions/vlsub.lua"
    install -Dm644 README.md "${pkgdir}/usr/share/${pkgname%-git}/README"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/${pkgname%-git}/CHANGELOG"
}
