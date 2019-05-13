# Maintainer: Luca CPZ <luca.cpz [at] gmail [dot] com>

pkgname=lain-git
pkgcom=1697; /pkgsha=/cpkgsha=3328e73
pkgsha=724c7b9
pkgver=$pkgcom.$pkgsha
pkgrel=1
pkgdesc="Layouts, asynchronous widgets and utilities for Awesome WM"
arch=('any')
url="https://github.com/lcpz/lain"
license=('GPL2')
depends=('awesome')
optdepends=('curl: for IMAP, MPD and weather widgets')
makedepends=('git')
provides=('lain')
conflicts=('lain')
source=("git://github.com/lcpz/lain.git")
md5sums=('SKIP')

package() {
    # check if awesome is stable or git
    if [ -d "/usr/share/awesome/lib/" ]; then
        aw_path="$pkgdir/usr/share/awesome/lib"
    else
        aw_path="$pkgdir/usr/local/share/awesome/lib"
    fi

    install -dm755 "$aw_path/lain"
    git --git-dir=lain/.git --work-tree=lain/ reset --hard $pkgsha --quiet
    rm -rf lain/{wiki,.git*,*.rockspec,*TEMPLATE*}
    cp -a lain $aw_path
}
