# Maintainer: Sergey Kasmy <SleeplessSloth79@gmail.com>
# Contributor: Adam Rutkowski <hq@mtod.org>
# Contributor: FabioLolix <fabio.lolix@gmail.com>

pkgname=liquidctl
pkgver=1.3.3
pkgrel=5
pkgdesc="Cross-platform tool and drivers for liquid coolers and other devices"
url="https://github.com/jonasmalacofilho/liquidctl"
depends=('python' 'python-setuptools' 'python-pyusb' 'python-hidapi' 'python-docopt')
license=('GPL3')
arch=('any')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d13180867e07420c5890fe1110e8f45fe343794549a9ed7d5e8e76663bc10c24')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # use $NAME or "generic" if $PRETTY_NAME isn't available
    export DIST_NAME="$(source /etc/os-release && if [ -n "$PRETTY_NAME" ]; then echo "$PRETTY_NAME"; elif [ -n "$NAME" ]; then echo "$NAME"; else echo "generic"; fi)"
    export DIST_PACKAGE="$pkgname $pkgver-$pkgrel"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 liquidctl.8 "${pkgdir}/usr/share/man/man8/liquidctl.8"
}
