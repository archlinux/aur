# Maintainer: Maxime Dirksen <dirksen.maxime@gmail.com>
# Co-Maintener: Supdrewin <supdrewin@outlook.com>
# Co-Maintainer: Andrey Kolchenko <andrey@kolchenko.me>
# Co-Maintainer: Rui ZHAO <renyuneyun@gmail.com>
# Contributor: Antoine Bertin <ant.bertin@gmail.com>

pkgname=linux-enable-ir-emitter
pkgver=3.1.1
pkgrel=1
epoch=1
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box."
url='https://github.com/EmixamPP/linux-enable-ir-emitter'
license=('MIT')
arch=('x86_64')

provides=(linux-enable-ir-emitter)
conflicts=(linux-enable-ir-emitter-git chicony-ir-toggle)

depends=(python python-opencv python-yaml)

install=linux-enable-ir-emitter.install

source=("https://github.com/EmixamPP/linux-enable-ir-emitter/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('81a23c9a0b8f01ef8d460e97752e3deda31a23eaa15a2d6b177f298f2ab13dc2')

build() {
    make -C "${srcdir}/${pkgname}-${pkgver}/sources/uvc"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

    # software
    install -Dm 755 sources/uvc/*query  -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/uvc/
    install -Dm 755 sources/uvc/*query.o  -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/uvc/

    install -Dm 644 sources/command/*.py -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/command/

    install -Dm 644 sources/*.py -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/

    # boot service
    install -Dm 644 sources/linux-enable-ir-emitter.service -t ${pkgdir}/usr/lib/systemd/system/
}
