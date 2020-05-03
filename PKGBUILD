# Maintainer: florianmw <flo@i-z-i.net>

pkgname=('automathemely')
_name='AutomaThemely'
pkgver='1.3'
pkgrel=2
pkgdesc="Simple, set-and-forget python application for changing between GNOME themes according to light and dark hours."
url="https://github.com/C2N14/AutomaThemely"
depends=('python')
makedepends=('python-setuptools')
license=('GPL-3.0')
arch=('any')
install=${pkgname}.install
source=("https://github.com/C2N14/${_name}/archive/v${pkgver}.tar.gz"
        ${pkgname}.install
        ${pkgname}.service
        ${pkgname}.timer
)
sha256sums=('14e5100eb911ab8e5667a3358e1e7ed6540fd1a294ba4d451d4db480b08c3555'
            'b853ded02b52867e4695c7df10aa7559f8b2c4eb98761aca20e9a856cc1294e0'
            '6c0e4e6076f2cce0cef8c5aec79f9ea6106240051b1d556eabea4c391fe0d834'
            '0b39fc8abf200b1438b01deb48133817e4dc1cd6e7e41cebe7e82118ed96999e')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  depends+=('python-astral' 'python-tzlocal' 'python-schedule')
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t ${pkgdir}/usr/lib/systemd/user ${srcdir}/${pkgname}.service ${srcdir}/${pkgname}.timer
}
