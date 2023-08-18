# Maintainer : Eric Lesiuta <elesiuta@gmail.com>

pkgname=picosnitch
pkgver=0.14.1
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
sha256sums=('db0bf02a6765368ec95995742a5156eac512160f99c1ec2e8cbab1ddffbc070d')

build() {
    python setup.py build
}

package() {
    python setup.py install --prefix='/usr' --root="$pkgdir" --skip-build
    install -D -m644 "${srcdir}/debian/picosnitch.service" "${pkgdir}/usr/lib/systemd/system/picosnitch.service"
}
