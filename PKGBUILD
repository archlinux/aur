# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>

pkgname=game-devices-udev
pkgver=0.24
pkgrel=0.1
pkgdesc="Udev rules for controllers"
url='https://codeberg.org/fabiscafe/game-devices-udev'
arch=('any')
license=('MIT')
depends=('udev')
makedepends=('git')
provides=('nintendo-udev')
install="install"
source=("git+${url}.git?signed#tag=$pkgver"
        "uinput.conf")
b2sums=('b5f5860161f2e738882c30902678679665646f4be0ad5735a82021aeba73656829355c079b999c02a50f2fab354d8d340f11113f54b95dcc501248dbb941d057'
        '4f298ba1d1fdc19f5b90ea8d9292be9a44c85567995ea14136e401d39ce3c159b43be50f0043d1f10bed6892d24d8f7a6bf04f5a448ee2044f43b07c4c66cee0')

validpgpkeys=(6E58E886A8E07538A2485FAED6A4F386B4881229) #Fabian Bornschein <fabiscafe-at-mailbox-dot-org>

package() {
    # install license
    install -Dm 644 "${srcdir}/${pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # install udev rules
    install -dm 755 "${pkgdir}/usr/lib/udev/rules.d"
    cp "${srcdir}/${pkgname}"/*.rules \
        "${pkgdir}/usr/lib/udev/rules.d/"

    # start uinput at boot
    install -Dm 644 "${srcdir}/uinput.conf" \
        "${pkgdir}/usr/lib/modules-load.d/uinput.conf"
}
