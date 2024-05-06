# Maintainer: Fabian Bornschein <fabiscafe-at-mailbox-dot-org>

pkgname=game-devices-udev
pkgver=0.23
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
b2sums=('6c545132593d6430677aa3acbd804b5a4e9153111ff0c5454b191c630d4dad7243ee27def6067faeaa7c1b42569041bec7ecd56dde711d49141db348a1fb84a6'
        '4f298ba1d1fdc19f5b90ea8d9292be9a44c85567995ea14136e401d39ce3c159b43be50f0043d1f10bed6892d24d8f7a6bf04f5a448ee2044f43b07c4c66cee0')

validpgpkeys=(6E58E886A8E07538A2485FAED6A4F386B4881229) #Fabian Bornschein <fabiscafe@mailbox.org>

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
