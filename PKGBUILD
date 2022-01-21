# Contributor: Jeremy MJ <jskier@gmail.com>
# Contributor: Niklas Hedlund <nojan1989@gmail.com>
pkgname=motioneye
pkgver=0.42.1
pkgrel=4
pkgdesc="A web frontend for the motion daemon"
arch=(any)
url="https://github.com/ccrisan/${pkgname}"
license=(GPL3)
depends=(motion ffmpeg openssl curl python-tornado5 python-jinja python-pillow mime-types)
# python-pytz v4l-utils
makedepends=(python-setuptools)
options=(emptydirs)
install=${pkgname}.install
backup=("etc/${pkgname}/${pkgname}.conf")
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('462e24b520d17578a0ba69fac704ef8ed9d65b8b5b21f00ebd4796e4a7eb1f25dd365b80c4efb81c6f03b3c2f9b33a7158104126869e3f3fca65c916fe764102')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  mkdir -p ${pkgdir}/opt/${pkgname} ${pkgdir}/etc/${pkgname} ${pkgdir}/var/lib/${pkgname}

  cp ${srcdir}/${pkgname}-${pkgver}/extra/${pkgname}.conf.sample ${pkgdir}/etc/${pkgname}/${pkgname}.conf
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/extra/${pkgname}.systemd-unit" ${pkgdir}/usr/lib/systemd/system/${pkgname}.service

  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
