# Maintainer : Eric Lesiuta <elesiuta@gmail.com>

pkgname=picosnitch
pkgver=0.11.7
pkgrel=1
pkgdesc='Monitor network traffic per executable using BPF'
arch=('any')
url='https://elesiuta.github.io/picosnitch/'
license=('GPL3')
depends=('python-bcc' 'python-dash' 'dbus-python' 'python-pandas' 'python-plotly' 'python-psutil' 'python-requests')
makedepends=('python-setuptools')
optdepends=()
provides=()
conflicts=()
source=("picosnitch-${pkgver}.tar.gz::https://github.com/elesiuta/picosnitch/releases/download/v${pkgver}/picosnitch.tar.gz")
sha256sums=('e0245ff7e6c1d22c37db9a52d9dc073ae7ba8e56ddcf15c87c7a9e212a85bb6e')

build() {
    python setup.py build
}

package() {
    python setup.py install --prefix='/usr' --root="$pkgdir" --skip-build --optimize='1'
    install -D -m644 "${srcdir}/debian/picosnitch.service" "${pkgdir}/usr/lib/systemd/system/picosnitch.service"
}
