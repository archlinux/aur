# Contributor: fitu996 <fitu996 at gmail dot com>

pkgname=ffqueue-git
pkgver=1.7.67.r0.g15db4f2
pkgrel=1
pkgdesc='Graphical user interface for FFMpeg with comprehensive support for basic and advances features'
arch=('i686' 'x86_64')
url='https://ffqueue.bruchhaus.dk/'
license=('GPL-3.0-or-later')
depends=('ffmpeg' 'wxwidgets-gtk3' 'zlib')
makedepends=('git')
provides=('ffqueue')
conflicts=('ffqueue')
source=("$pkgname"::'git+https://github.com/bswebdk/FFQueue.git'
        "ffqueue.desktop")
sha256sums=('SKIP'
            '3cb05b6a57027a6c663b3d358b7163b1733e8ea64e339a4ac7955947160188a3')

pkgver() {
    cd "$pkgname/"
    git describe --long --tags | sed 's/-/.r/;s/-/./g'
}

build() {
    cd "$pkgname/"
    autoreconf -fiv
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname"
    install -Dm 755 -t "$pkgdir/usr/bin/" ./src/ffqueue
    install -Dm 644 -t "$pkgdir/usr/share/applications/" ../ffqueue.desktop
    install -Dm 644 ./res/MainLogo.png "$pkgdir/usr/share/pixmaps/ffqueue.png"
} 

# vim: set ts=4 sw=4 et:
