#Maintainer: Sergey Kasmy <SleeplessSloth79@gmail.com>

pkgname=liquidctl
pkgver='1.3.0'
pkgrel=1
pkgdesc="Cross-platform tool and drivers for liquid coolers and other devices"
url="https://github.com/jonasmalacofilho/liquidctl"
depends=('python' 'python-setuptools' 'python-pyusb' 'python-hidapi' 'python-docopt')
makedepends=()
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/l/liquidctl/liquidctl-${pkgver}.tar.gz")
sha256sums=('ce0483b0a7f9cf2618cb30bdf3ff4195e20d9df6c615f69afe127f54956e42ce')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export DIST_NAME="$(source /etc/os-release && echo $PRETTY_NAME)"
    export DIST_PACKAGE="$pkgname $pkgver-$pkgrel"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 liquidctl.8 "${pkgdir}/usr/share/man/man8/liquidctl.8"
}
