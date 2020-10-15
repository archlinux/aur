# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=etesync-dav
pkgver=0.30.0
pkgrel=1
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
sha512sums=('9d4e7034909798877881eba7c247c24f5f0cd2822d0769d9a814640411cbd6686b527cb294c191b2d3a7aec6ad432b9ef0607fd74163f696378ce76a06202759'
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

