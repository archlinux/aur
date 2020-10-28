# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=etesync-dav
pkgver=0.30.2
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
sha512sums=('d6af6fc17d4d340bc59822a247b41123a6279b5e7dcfbfafdf175c4ce4fa22258659ef780f9d5c7e7d63b369d242d6513553e97c4ebcca82d7aff02e72892f62'
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

