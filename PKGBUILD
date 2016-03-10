# Maintainer: Weitian Leung <weitianleung[at]gmail[dot]com>

pkgname=bing-wallpaper-git
pkgver=r25
pkgrel=1
pkgdesc="Change wallpaper from Bing daily"
arch=(any)
license=('GPL3')
depends=('curl' 'bc')
optdepends=('xfconf: for xfce4 support')
makedepends=('git')
source=("$pkgname::git+https://github.com/marguerite/linux-bing-wallpaper.git"
        'bing-wallpaper-autostart.sh'
        'bing-wallpaper.desktop')
md5sums=('SKIP'
         '6b530d42e0c7f817e4a36376ea0ad6e2'
         '1e65c7c30461dcc752f4766e5a14bc76')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s" "$(git rev-list --count HEAD)"
}

package() {
    install -d "$pkgdir/usr/lib/bing-wallpaper"
    cp "$srcdir/$pkgname/"*.sh "$pkgdir/usr/lib/bing-wallpaper"

    install -d "$pkgdir/usr/bin"
    cp bing-wallpaper-autostart.sh "$pkgdir/usr/bin"

    install -d "$pkgdir/etc/xdg/autostart"
    cp bing-wallpaper.desktop "$pkgdir/etc/xdg/autostart"
}
