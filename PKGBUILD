# Maintainer: Weitian Leung <weitianleung[at]gmail[dot]com>

pkgname=bing-wallpaper-git
pkgver=r60
pkgrel=1
pkgdesc="Bing Wallpaper of the Day as your Linux Desktop's wallpaper"
arch=(any)
url="https://github.com/marguerite/linux-bing-wallpaper"
license=('GPL3')
optdepends=('xfconf: for xfce4 support'
            'pcmanfm-qt: for lxqt support'
            'xdotool: for kde4 support'
            'gettext: for kde4 support')
makedepends=('git' 'go')
source=("$pkgname::git+https://github.com/marguerite/linux-bing-wallpaper.git")
sha512sums=('SKIP')
install=${pkgname}.install

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s" "$(git rev-list --count HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    go build bing-wallpaper.go
}

package() {
    build_dir="${srcdir}/${pkgname}"
    install -Dm755 "${build_dir}/bing-wallpaper" "${pkgdir}/usr/bin/bing-wallpaper"
    install -Dm644 "${build_dir}/bing-wallpaper.service" "${pkgdir}/usr/lib/systemd/user/bing-wallpaper.service"
}
