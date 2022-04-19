# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname='dwall'
pkgname="${_pkgname}-git"
pkgver=r6.fe7b1c4
pkgrel=1
pkgdesc="A simple bash script to set wallpapers according to current time, using cron job scheduler."
arch=('i686' 'x86_64')
url="https://github.com/adi1090x/dynamic-wallpaper"
license=('GPL3')
depends=('feh' 'cronie')
makedepends=('git' 'sed')
optdepends=('xorg-xrandr: XFCE support'
    'pywal-git: pywal support'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/adi1090x/dynamic-wallpaper.git')
sha1sums=('SKIP')

pkgver() {
    cd dynamic-wallpaper
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_walldir="${pkgdir}/opt/${pkgname}"

prepare() {
    cd dynamic-wallpaper
    sed -i "s~DIR=\"/usr/share/dynamic-wallpaper/images\"~DIR=\"${_walldir}\"~" dwall.sh
}

package() {
    cd dynamic-wallpaper
    install -Dm755 dwall.sh "${pkgdir}/usr/bin/dwall"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -d "${pkgdir}/opt/${pkgname}/"
    cp -r images/* "${pkgdir}/opt/${pkgname}/"
}

# change to home dir
