# Maintainer: f4iey <f4iey@f6kgl.ampr.org>
pkgname=m17client-git
pkgver=r138.8fe79b0
pkgrel=1
pkgdesc="An M17 client designed for use with MMDVM modems and hotspots to allow for use as an M17 radio "
arch=('any')
url="https://github.com/g4klx/M17Client"
license=('GPL-3')
makedepends=(git)
depends=(alsa-lib libsamplerate wxgtk3)
optdepends=(hamlib pulseaudio)
source=($pkgname::git+$url)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/$pkgname
    #Daemon
    cd $srcdir/$pkgname/Daemon
    make all
    #GUI
    cd $srcdir/$pkgname/GUI
    make all
    #TS
    cd $srcdir/$pkgname/TS
    make all
}

package() {
    cd "${srcdir}/$pkgname"
    install -Dm755 "Daemon/M17Client" "$pkgdir/usr/local/bin/M17Client"
    install -g bin -o root -Dm755 "GUI/M17GUI" "$pkgdir/usr/bin/M17GUI"
    install -m755 "TS/M17TS" "$pkgdir/usr/bin/"
} 
