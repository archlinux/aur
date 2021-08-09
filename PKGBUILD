# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>
# Co-Maintainer: Maxime Dirksen <dirksen.maxime@gmail.com>
# Contributor: Antoine Bertin <ant.bertin@gmail.com>

pkgname=linux-enable-ir-emitter
pkgver=2.0.1
pkgrel=1
epoch=1
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box."
url='https://github.com/EmixamPP/linux-enable-ir-emitter'
license=('MIT')
arch=('x86_64')

provides=(linux-enable-ir-emitter)
conflicts=(linux-enable-ir-emitter-git chicony-ir-toggle)

depends=(
    'python'
    'python-opencv'
    'python-yaml'
    'nano'
)
optdepends=(
    'python-pyshark: full configuration setup support'
)
source=("https://github.com/EmixamPP/linux-enable-ir-emitter/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3f4e7f59daa9f8ad72f9141577a481e225137710daff5feeba153c21ef8f2b15')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/sources"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

    install -Dm 755 sources/enable-ir-emitter -t "${pkgdir}"/usr/lib/linux-enable-ir-emitter/
    install -Dm 644 sources/config.yaml -t "${pkgdir}"/usr/lib/linux-enable-ir-emitter/
    install -Dm 755 sources/*.py -t "${pkgdir}"/usr/lib/linux-enable-ir-emitter/

    install -Dm 644 sources/linux-enable-ir-emitter.service -t "${pkgdir}"/usr/lib/systemd/system/

    install -dm 755 ${pkgdir}/usr/bin/
    ln -fs /usr/lib/linux-enable-ir-emitter/linux-enable-ir-emitter.py ${pkgdir}/usr/bin/linux-enable-ir-emitter
}
