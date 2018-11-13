# Maintainer: Raku <raku at raku dot party>

pkgname=syspeek-vala-bzr
_bzrname=syspeekv
pkgver=r10
pkgrel=1
pkgdesc="A small system monitor indicator that displays CPU usage, memory usage, swap usage, disk usage and network traffic. Vala rewrite"
arch=(i686 x86_64)
url="https://launchpad.net/syspeekv"
license=('GPLv3')
depends=('gtk3' 'libappindicator-gtk3' 'glib2' 'hicolor-icon-theme')
makedepends=('bzr' 'vala')
provides=('syspeek')
source=('bzr+lp:/syspeekv')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_bzrname}"
    echo "r$(bzr revno)"
}

build() {
    cd "$srcdir/$_bzrname"
    make SysPeekV PREFIX=/usr
}

package() {
    cd "$srcdir/$_bzrname"

    install -D -m755 "SysPeekV" "$pkgdir/usr/bin/syspeek"

    install -d "$pkgdir/usr/share/icons/hicolor/22x22/status"

    install -D -m644 icons/hicolor/22x22/status/syspeek-*.svg "$pkgdir/usr/share/icons/hicolor/22x22/status"

    install -D -m644 icons/hicolor/256x256/apps/syspeek.svg "$pkgdir/usr/share/icons/hicolor/256x256/apps/syspeek.svg"
}