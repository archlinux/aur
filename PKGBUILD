# Maintainer: Weitian Leung <weitianleung[at]gmail[dot]com>

pkgname=bing-wallpaper-git
pkgver=r36
pkgrel=1
pkgdesc="Change wallpaper from Bing daily"
arch=(any)
url="https://github.com/marguerite/linux-bing-wallpaper"
license=('GPL3')
depends=('curl' 'bc')
optdepends=('xfconf: for xfce4 support'
            'pcmanfm-qt: for lxqt support')
makedepends=('git')
source=("$pkgname::git+https://github.com/marguerite/linux-bing-wallpaper.git"
        'bing-wallpaper-autostart.sh'
        'bing-wallpaper.desktop')
sha512sums=('SKIP'
         '131de9d1c55eb74760869d5ebaf64b722c43cafa2be90a3413d5e0d8c60bc62190825d44ba9155275bf3868d0b37869e3ad51878cf1d6d611562c4ba5b814c76'
         '83025c7c9e1957488f1e4bb385b599e8f17ca778a614f2bf8759cc99a9754e360ff1ecb8188eef7f9a7dbb8d2c6f93e6af4c8f441f88a6b2973e9737777b2d49')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s" "$(git rev-list --count HEAD)"
}

package() {
    install -d -m 755 "${pkgdir}/usr/lib/bing-wallpaper"
    install -d -m 755 "${pkgdir}/usr/bin"
    install -d -m 755 "${pkgdir}/etc/xdg/autostart"

    install -m 755 "${srcdir}/${pkgname}/bing_wallpaper.sh" "${pkgdir}/usr/lib/bing-wallpaper"
    install -m 755 "${srcdir}/${pkgname}/kde4_set_wallpaper.sh" "${pkgdir}/usr/lib/bing-wallpaper"
    install -m 755 "${srcdir}/${pkgname}/xfce4_set_wallpaper.sh" "${pkgdir}/usr/lib/bing-wallpaper"

    install -m 755 bing-wallpaper-autostart.sh "${pkgdir}/usr/bin"
    install -m 644 bing-wallpaper.desktop "$pkgdir/etc/xdg/autostart"
}
