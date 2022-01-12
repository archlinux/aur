# Maintainer : Eric Lesiuta <elesiuta@gmail.com>

pkgname=picosnitch
pkgver=0.9.1
pkgrel=1
pkgdesc='Protect your privacy, see which processes make remote network connections'
arch=('any')
url='https://elesiuta.github.io/picosnitch/'
license=('GPL3')
depends=('python-bcc' 'dbus-python' 'python-psutil' 'python-requests')
makedepends=('python-setuptools')
optdepends=()
provides=()
conflicts=()
source=("picosnitch-${pkgver}.tar.gz::https://github.com/elesiuta/picosnitch/releases/download/v${pkgver}/picosnitch.tar.gz")
sha256sums=('40826bf22f96d21b25c581efbc449a35c49a8b4035b3f2e52b1b9fb316751863')

build() {
    python setup.py build
}

package() {
    python setup.py install --prefix='/usr' --root="$pkgdir" --skip-build --optimize='1'
    install -D -m644 "${srcdir}/debian/picosnitch.service" "${pkgdir}/usr/lib/systemd/system/picosnitch.service"
}
