# Maintainer: Maxime Dirksen <dirksen.maxime@gmail.com>
# Maintainer: Antoine Bertin <ant.bertin@gmail.com>
# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=linux-enable-ir-emitter
pkgver=20210725.0
pkgrel=1
pkgdesc='Enables infrared cameras that are not directly enabled out-of-the box.'
url='https://github.com/EmixamPP/linux-enable-ir-emitter'
license=(MIT)
arch=(x86_64)

provides=(linux-enable-ir-emitter)
conflicts=(chicony-ir-toggle)

makedepends=('gcc' 'git' 'make')
depends=('python' 'python-opencv' 'python-yaml')
optdepends=(
    'python-pyshark: full configuration setup support'
    'systemd: system and service manager to support linux-enable-ir-emitter running automatically'
)

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
