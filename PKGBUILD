# Maintainer: Kibouo <csonka.mihaly@hotmail.com>
pkgname=gnome-wallpaper-changer-git
pkgver=r27.5ea3237
pkgrel=3
pkgdesc='Set Gnome Desktop wallpaper to an image from a provided directory.'
arch=('any')
url='https://github.com/Kibouo/gnome-wallpaper-changer'
license=('GPL2')
depends=('bash')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
install='gnome-wallpaper-changer.install'
source=("${pkgname}::git+https://github.com/Kibouo/gnome-wallpaper-changer.git"
        "gnome-wallpaper-changer.install")
md5sums=('SKIP'
        f58ef31de215a0716d5e70e27e3b308a)
pkgver() {
	cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}${HOME}/.config/autostart"

    cd "${pkgname}"
    install -Dm755 ./gnome-wallpaper-changer "${pkgdir}/usr/bin"
    cp -u ./gnome-wallpaper-changer.desktop "${pkgdir}${HOME}/.config/autostart"
}
