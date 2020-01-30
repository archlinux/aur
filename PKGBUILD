# Maintainer: Abdalaziz Rashid <abdalaziz.rashid@edu.misis.ru> & Maxim Kochurov <maxim.v.kochurov@gmail.com>

author=abdalazizrashid
pkgname=dwm-hidpi-git
_gitname=dwm-HiDPI
pkgver=0.r1685.4e4080c
pkgrel=1
pkgdesc='dwm fork intended for 4K displays'
url='https://github.com/abdalazizrashid/dwm-HiDPI'
arch=('any')
license=('MIT')
depends=('libx11' 'libxinerama' 'libxft' 'dmenu' 'freetype2' )
makedepends=('git')
conflicts=('dwm')
provides=('dwm')

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
    cp -a --no-preserve=ownership * "$pkgdir/usr/share/$pkgname"
    chmod -R 777 "$pkgdir/usr/share/$pkgname"
}

