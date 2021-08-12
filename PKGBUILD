# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Nikolay Bryskin <nbryskin@gmail.com>

pkgname=linux-enable-ir-emitter-git
pkgver=r167.04f6c73
pkgrel=1
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box"
arch=(x86_64)
url="https://github.com/EmixamPP/linux-enable-ir-emitter"
license=(MIT)
depends=(python python-opencv python-yaml)
makedepends=(git)
optdepends=('python-pyshark: full configuration setup support')
provides=(linux-enable-ir-emitter)
conflicts=(linux-enable-ir-emitter chicony-ir-toggle)
source=("git+https://github.com/EmixamPP/linux-enable-ir-emitter")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/linux-enable-ir-emitter/sources"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/linux-enable-ir-emitter/sources"
    make
}

package() {
    cd "${srcdir}/linux-enable-ir-emitter"
    install -Dm 755 sources/enable-ir-emitter "${pkgdir}"/usr/lib/linux-enable-ir-emitter/enable-ir-emitter
    install -Dm 644 sources/config.yaml "${pkgdir}"/usr/lib/linux-enable-ir-emitter/config.yaml
    install -Dm 755 sources/*.py "${pkgdir}"/usr/lib/linux-enable-ir-emitter/
    install -Dm 644 sources/linux-enable-ir-emitter.service "${pkgdir}"/usr/lib/systemd/system/linux-enable-ir-emitter.service
    install -dm 755 "${pkgdir}"/usr/bin/
    ln -s /usr/lib/linux-enable-ir-emitter/linux-enable-ir-emitter.py "${pkgdir}"/usr/bin/linux-enable-ir-emitter
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
