# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Contributor: j.r <j.r@jugendhacker.de>
# Contributor: Matthew Murray <matt@mattmurr.xyz>
pkgname=open-fprintd
pkgver=0.6
pkgrel=4
pkgdesc="Fprintd replacement which allows you to have your own backend as a standalone service"
arch=(any)
license=('GPL')
depends=(python
         fprintd-clients
         gobject-introspection-runtime
         dbus-python
         python-gobject)
makedepends=(python-setuptools)
url="https://github.com/uunicorn/${pkgname}"
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('3254779b0199521b79b6933700355606')

build() {
  cd "${srcdir}/${pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  python setup.py install --prefix=/usr --root "$pkgdir" || return 1

  install -D -m 644 debian/open-fprintd.service \
    "${pkgdir}/usr/lib/systemd/system/open-fprintd.service"

  install -D -m 644 debian/open-fprintd-resume.service \
    "${pkgdir}/usr/lib/systemd/system/open-fprintd-resume.service"

  install -D -m 644 debian/open-fprintd-suspend.service \
    "${pkgdir}/usr/lib/systemd/system/open-fprintd-suspend.service"
}
