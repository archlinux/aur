# Maintainer: mako yass <m.arcus.yass@gmail.com>
pkgname=defter-scrolling
pkgver=0.10.0
pkgrel=1
pkgdesc="A better way of scrolling, for mice"
arch=('any')
url="https://github.com/makoConstruct/middle-good-scrolling"
license=('0BSD')
depends=('python' 'python-evdev' 'python-pyudev')
backup=('etc/defter-scrolling.conf')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/makoConstruct/middle-good-scrolling/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/middle-good-scrolling-${pkgver}"
    install -Dm755 defter-scrolling "${pkgdir}/usr/bin/defter-scrolling"
    ./generate-service.sh /usr/bin/defter-scrolling > "${srcdir}/defter-scrolling.service"
    install -Dm644 "${srcdir}/defter-scrolling.service" "${pkgdir}/usr/lib/systemd/system/defter-scrolling.service"
    install -Dm644 80-defter-scrolling.preset "${pkgdir}/usr/lib/systemd/system-preset/80-defter-scrolling.preset"
    install -Dm644 defter-scrolling.conf "${pkgdir}/etc/defter-scrolling.conf"
}
