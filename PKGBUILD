# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=etesync-dav
pkgver=0.16.0
pkgrel=1
pkgdesc="A CalDAV and CardDAV adapter for EteSync"
arch=('any')
url="https://pypi.python.org/pypi/${pkgname}/"
license=('GPL')
depends=('python-appdirs'
         'python-etesync'
         'radicale'
         'python-flask'
         'python-flask-wtf'
)
replaces=('python-radicale-storage-etesync')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/e/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "etesync-dav.service")
sha512sums=('b406213b394882fc23ad34e13c44ad1a6d2bbab8151051e42bbad55279585c7b33809822a11d459987aed5d3efc948cda9744924bef1edc370b647196e4b228a'
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

