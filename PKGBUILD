# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=etesync-dav
pkgver=0.30.0
pkgrel=2
pkgdesc="A CalDAV and CardDAV adapter for EteSync"
arch=('any')
url="https://pypi.python.org/pypi/${pkgname}/"
license=('GPL')
depends=('python-appdirs'
         'python-etesync'
         'python-etebase'
         'radicale>=3.0.0'
         'python-flask'
         'python-flask-wtf'
)
replaces=('python-radicale-storage-etesync')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/e/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "etesync-dav.service")
sha512sums=('499ae506b588f0926fa2bec0aed72f7af5fbda7c27f9202f1ba1265bf6824313f7482000ebd5e1fb5b0db30c06e7fdb9819d80de8224ddb87efc7ad59bd6f954'
            'SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm644 {DESCRIPTION.rst,README.md}

# FIXME: replace with the one in the etesync-dav repo once released
  mkdir -p "${pkgdir}/usr/lib/systemd/user/"
  install -Dm644 ../etesync-dav.service "${pkgdir}/usr/lib/systemd/user/"
}

