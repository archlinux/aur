# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

author=Baitinq
pkgname=surf-baitinq-git
_gitname=surf
pkgver=0.r574.2c3581f
pkgrel=1
pkgdesc="a WebKit based browser (Baitinq's version)"
url='https://github.com/Baitinq/surf.git'
arch=('any')
license=('GPL')
depends=('webkit2gtk' 'gcr' 'xorg-xprop')
makedepends=('git')
optdepends=('dmenu: url bar and search'
            'tabbed: tab browsing'
            'ca-certificates: SSL verification'
            'st: default terminal for the download handler'
            'curl: default download handler'
            'mpv: default video player')
provides=('surf')

# include config.h and any patches you want to have applied here
source=("git://github.com/$author/$_gitname.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_gitname"
    make
}

package() {
    cd "$_gitname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    mkdir -p "$pkgdir/usr/share/$pkgname"
    cp -r -a --no-preserve=ownership * "$pkgdir/usr/share/$pkgname"
    chmod -R 777 "$pkgdir/usr/share/$pkgname"
}
