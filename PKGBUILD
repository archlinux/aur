# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=sysdweb
pkgver=1.1.3
pkgrel=1
pkgdesc='Control systemd services through Web or REST API'
arch=('any')
url='https://github.com/ogarcia/sysdweb'
license=('GPL')
depends=('python-bottle' 'python-dbus' 'python-pam' 'python-setuptools' 'python-systemd')
makedepends=('python-setuptools')
backup=("etc/${pkgname}.conf")
source=("https://github.com/ogarcia/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('abdaa501d00837c9335828cc03b202374c19e5033199c6bd6a60dc4849d90b3c')

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
