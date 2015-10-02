# Maintainer: Weitian Leung <weitianleung[at]gmail[dot]com>

pkgname=bing-wallpaper-git
pkgver=r8.2c8d18a
pkgrel=1
pkgdesc="Change wallpaper from Bing daily"
arch=(any)
license=('GPL3')
depends=('curl')
optdepends=('xorg-xrandr: for xfce4 support'
            'xfconf: for xfce4 support')
makedepends=('git')
source=("$pkgname::git+https://github.com/timxx/linux-bing-wallpaper.git"
        'bing-wallpaper-autostart.sh'
        'bing-wallpaper.desktop')
md5sums=('SKIP'
         'b84e976323ea41d5c53c71384bd281a8'
         '1e65c7c30461dcc752f4766e5a14bc76')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d "$pkgdir/usr/lib/bing-wallpaper"
    cp "$srcdir/$pkgname/"*.sh "$pkgdir/usr/lib/bing-wallpaper"

    install -d "$pkgdir/usr/bin"
    cp bing-wallpaper-autostart.sh "$pkgdir/usr/bin"

    install -d "$pkgdir/etc/xdg/autostart"
    cp bing-wallpaper.desktop "$pkgdir/etc/xdg/autostart"
}
