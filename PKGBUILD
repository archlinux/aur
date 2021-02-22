# Maintainer: Kibouo <csonka.mihaly@hotmail.com>
pkgname=gnome-wallpaper-changer-git
pkgver=r10.046d103
pkgrel=1
pkgdesc='Set Gnome Desktop wallpaper to an image from a provided directory.'
arch=('any')
url='https://gitlab.com/Kibouo/gnome-wallpaper-changer'
license=('MIT')
depends=('bash')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
install='gnome-wallpaper-changer.install'
source=("${pkgname}::git+https://gitlab.com/Kibouo/gnome-wallpaper-changer.git"
        "gnome-wallpaper-changer.install")
md5sums=('SKIP'
        948ea0e1975c20700f7af001515b173c)
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
