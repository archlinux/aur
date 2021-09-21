# Maintainer: Maxime Dirksen <dirksen.maxime@gmail.com>
# Co-Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Co-Maintener: Supdrewin <supdrewin@outlook.com>
# Contributor: Nikolay Bryskin <nbryskin@gmail.com>

pkgname=linux-enable-ir-emitter-git
pkgver=r213.bbd130e
pkgrel=1
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box"
url="https://github.com/EmixamPP/linux-enable-ir-emitter"
license=(MIT)
arch=(x86_64)

provides=(linux-enable-ir-emitter)
conflicts=(linux-enable-ir-emitter chicony-ir-toggle)

makedepends=(git)
depends=(python python-opencv python-yaml)

install=linux-enable-ir-emitter.install

source=("git+https://github.com/EmixamPP/linux-enable-ir-emitter")
sha256sums=('SKIP')

pkgver() {
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    make -C "${srcdir}/linux-enable-ir-emitter/sources/uvc"
}

package() {
    cd "${srcdir}/${pkgname/-git}"

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

    # software
    install -Dm 755 sources/uvc/*query  -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/uvc/
    install -Dm 755 sources/uvc/*query.o  -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/uvc/

    install -Dm 644 sources/command/*.py -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/command/

    install -Dm 644 sources/*.py -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/

    # boot service
    install -Dm 644 sources/linux-enable-ir-emitter.service -t ${pkgdir}/usr/lib/systemd/system/
}
