# Maintainer: f4iey <f4iey@f6kgl.ampr.org>
pkgname=trlinux-git
pkgver=r524.0f524aa
pkgrel=1
pkgdesc="N6TR's TR log "
arch=('any')
license=('GPL2')
url="https://github.com/trlinux/trlinux"
makedepends=('git' 'fpc' 'texlive-latexextra')
depends=('libusb' 'libieee1284' 'curl' 'alsa-lib' 'libsndfile' 'nmap')
source=($pkgname::"git+$url.git")

sha256sums=('SKIP')

build() {
    cd $srcdir/$pkgname
    make
}

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $srcdir/$pkgname
    install -dm755 $pkgdir/usr/bin
    install -Dm755 src/trlog $pkgdir/etc/trlog/trlog
    install -Dm755 src/post $pkgdir/etc/trlog/post
    install -Dm755 log/* $pkgdir/etc/trlog/
    install -Dm644 doc/trloglinux.pdf $pkgdir/usr/share/doc/trlog/trloglinux.pdf
    ln -sf /etc/trlog/trlog $pkgdir/usr/bin/
    ln -sf /etc/trlog/post $pkgdir/usr/bin/trlog-post

}
