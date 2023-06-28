# Maintainer: Joaquín I. Aramendía <samsagax@gmail.com>
# Contributor: Philip Müller <philm@manjaro.org>

pkgname=asus-cirrus-firmware-git
pkgver=r3.5d521dc
pkgrel=1
pkgdesc="ASUS Cirrus firmwares for various sound devices"
url="https://gitlab.com/asus-linux/firmware"
license=('custom')
arch=('any')
makedepends=('git')
source=("asus-firmware::git+https://gitlab.com/asus-linux/firmware"
        'LICENSE.cirrus')
sha256sums=('SKIP'
            'de3ab9496897105826e50ad621689963289e0fe3635b80fc9f420100dcc8304a')

pkgver() {
    cd "asus-firmware"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd ${srcdir}/asus-firmware

    mkdir -p ${pkgdir}/usr/lib/firmware
    cp -av * ${pkgdir}/usr/lib/firmware/.

    install -Dm644 "${srcdir}"/LICENSE.cirrus "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.cirrus
}
