# Maintainer : Eric Lesiuta <elesiuta@gmail.com>

pkgname=picosnitch
pkgver=0.14.0
pkgrel=1
pkgdesc='Monitor network traffic per executable using BPF'
arch=('any')
url='https://elesiuta.github.io/picosnitch/'
license=('GPL3')
depends=('python-bcc' 'python-dash' 'dbus-python' 'python-geoip2' 'python-pandas' 'python-plotly' 'python-psutil' 'python-requests')
makedepends=('python-setuptools')
optdepends=()
provides=()
conflicts=()
source=("picosnitch-${pkgver}.tar.gz::https://github.com/elesiuta/picosnitch/releases/download/v${pkgver}/picosnitch.tar.gz")
sha256sums=('733282d31a615fad4a338eb557a3be7cfe9f576884c856a4cb79171a3ccb7bff')

build() {
    python setup.py build
}

package() {
    python setup.py install --prefix='/usr' --root="$pkgdir" --skip-build
    install -D -m644 "${srcdir}/debian/picosnitch.service" "${pkgdir}/usr/lib/systemd/system/picosnitch.service"
}
