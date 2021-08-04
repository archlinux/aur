# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>
# Co-Maintainer: Maxime Dirksen <dirksen.maxime@gmail.com>
# Contributor: Antoine Bertin <ant.bertin@gmail.com>

pkgname=linux-enable-ir-emitter
pkgver=2.0.0
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
)
optdepends=(
    'python-pyshark: full configuration setup support'
)
source=("https://github.com/EmixamPP/linux-enable-ir-emitter/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6d52c11ec93efeabc2cc2dc7a43a6624a1f91bac1ce57d9935e8198a4017fe0b')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/sources"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

    install -Dm 755 sources/enable-ir-emitter "${pkgdir}"/usr/lib/linux-enable-ir-emitter/enable-ir-emitter
    install -Dm 644 sources/config.yaml "${pkgdir}"/usr/lib/linux-enable-ir-emitter/config.yaml
    install -Dm 755 sources/*.py "${pkgdir}"/usr/lib/linux-enable-ir-emitter/

    install -Dm 644 sources/linux-enable-ir-emitter.service "${pkgdir}"/usr/lib/systemd/system/linux-enable-ir-emitter.service

    install -dm 755 ${pkgdir}/usr/bin/
    ln -s /usr/lib/linux-enable-ir-emitter/linux-enable-ir-emitter.py ${pkgdir}/usr/bin/linux-enable-ir-emitter
}
