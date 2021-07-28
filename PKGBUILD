# Maintainer: EmixamPP <https://github.com/EmixamPP/linux-enable-ir-emitter/issues>
# Maintainer: Antoine Bertin <ant.bertin@gmail.com>

pkgname=linux-enable-ir-emitter
pkgver=20210725.0
pkgrel=1
pkgdesc='Enables infrared cameras that are not directly enabled out-of-the box.'
url='https://github.com/EmixamPP/linux-enable-ir-emitter'
license=('MIT')
makedepends=('git')
depends=(
    'python'
    'python-opencv'
    'python-yaml'
)
optdepends=(
    'python-pyshark: full configuration setup support'
)
arch=('x86_64')
source=("git+https://github.com/EmixamPP/linux-enable-ir-emitter")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    cd sources
    make
}

package() {
    cd $srcdir/$pkgname
    install -Dm 755 sources/enable-ir-emitter $pkgdir/usr/lib/linux-enable-ir-emitter/enable-ir-emitter
    install -Dm 644 sources/config.yaml $pkgdir/usr/lib/linux-enable-ir-emitter/config.yaml
    install -Dm 755 sources/*.py $pkgdir/usr/lib/linux-enable-ir-emitter/
    install -Dm 644 sources/linux-enable-ir-emitter.service $pkgdir/usr/lib/systemd/system/linux-enable-ir-emitter.service
    install -dm 755 $pkgdir/usr/bin/
    ln -s /usr/lib/linux-enable-ir-emitter/linux-enable-ir-emitter.py $pkgdir/usr/bin/linux-enable-ir-emitter
}

