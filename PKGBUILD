# Maintainer: Abdalaziz Rashid <abdalaziz.rashid@edu.misis.ru> & Maxim Kochurov <maxim.v.kochurov@gmail.com>

author=abdalazizrashid
pkgname=dwm-hidpi-git
_gitname=dwm-HiDPI
pkgver=0.r1689.cd157f6
pkgrel=1
pkgdesc='A dwm fork intended for 4K displays'
url='https://github.com/abdalazizrashid/dwm-HiDPI'
arch=('any')
license=('MIT')
depends=('libx11' 'libxinerama' 'libxft' 'dmenu' 'freetype2' )
makedepends=('git')
conflicts=('dwm')
provides=('dwm')

# include config.h and any patches you want to have applied here
source=("git://github.com/$author/$_gitname.git"
	"https://dwm.suckless.org/patches/ewmhtags/dwm-ewmhtags-6.2.diff")

md5sums=('SKIP'
         '59670344f7cfc9b0de7853a88c3403af')
sha1sums=('SKIP'
          '68099d62819db00be5178031fcc7303356469958')
sha256sums=('SKIP'
            'e027e683c074f4cd00c52f07c81be9d64d4085ef5b0a570b1fb80b8f4668c100')

pkgver() {
    cd "$_gitname"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_gitname"
    patch -R -p1 -i "$srcdir/dwm-ewmhtags-6.2.diff"

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


