# Maintainer : Eric Lesiuta <elesiuta@gmail.com>

pkgname=picosnitch
pkgver=1.0.0
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
sha256sums=('74d8eaa2dc7f58483a4bbeb1f057e8f1def390083ecc277370cce4d5137036fc')

build() {
    python setup.py build
}

package() {
    python setup.py install --prefix='/usr' --root="$pkgdir" --skip-build
    install -D -m644 "${srcdir}/debian/picosnitch.service" "${pkgdir}/usr/lib/systemd/system/picosnitch.service"
}
