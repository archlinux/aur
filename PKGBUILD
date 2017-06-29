# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=sysdweb
pkgver=1.1
pkgrel=1
pkgdesc='Control systemd services through Web or REST API'
arch=('any')
url='https://github.com/ogarcia/sysdweb'
license=('GPL')
depends=('python-bottle' 'python-dbus' 'python-pam' 'python-systemd')
makedepends=('python-setuptools')
backup=("etc/${pkgname}.conf")
source=("https://github.com/ogarcia/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b18d1d22fe6ac5a46f2185b796a7d2d71cdb6e3e38b20d42ede4739bfadcd693')

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize='1'

  # config file
  install -D -m644 "${pkgname}.conf" \
    "${pkgdir}/etc/${pkgname}.conf"

  # doc file
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # service files
  install -D -m644 "systemd/${pkgname}-system.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -D -m644 "systemd/${pkgname}-user.service" \
    "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
}
