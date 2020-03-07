# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>
pkgname=sftpgo-bin
_pkgname=sftpgo
pkgver=0.9.6
pkgrel=2
pkgdesc='Full featured and highly configurable SFTP server'
arch=('x86_64')
url="https://github.com/drakkan/${_pkgname}"
license=('GPL3')
depends=('glibc')
optdepends=(
  "sqlite: to use SQLite provider"
  "postgresql: to use PostgreSQL provider"
  "mariadb: to use MySQL provider"
  "python-requests: REST API CLI"
  "python-pygments: REST API CLI colors highlight"
)
conflicts=('sftpgo')
provides=('sftpgo')
backup=(
  "etc/${_pkgname}/sftpgo.json"
  "etc/${_pkgname}/sftpgo.db"
  "var/lib/${_pkgname}/sftpgo.db"
)

source=("https://github.com/drakkan/sftpgo/releases/download/${pkgver}/sftpgo_${pkgver}_linux_x86_64.tar.xz"
  "sftpgo.json")
sha256sums=('128d03ab82abb279eb6b4781411dc68feed149fbc5a218f31acab010dd6ce4e3'
  'c1defd385855fc88a780a611b9076f24c61663123480ba14eee5f37f0396df86')

package() {
  install -Dm 755 sftpgo "$pkgdir/usr/bin/${_pkgname}"
  install -Dm 755 scripts/sftpgo_api_cli.py "${pkgdir}"/usr/bin/sftpgo_api_cli
  install -Dm 644 init/${_pkgname}.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/sftpgo.json" -t "${pkgdir}/etc/${_pkgname}"
  install -d "${pkgdir}/var/lib/${_pkgname}"
  install -Dm 644 sql/sqlite/sftpgo.db -t "${pkgdir}/var/lib/${_pkgname}"
  cp -r templates "${pkgdir}/var/lib/${_pkgname}/"
  cp -r static "${pkgdir}/var/lib/${_pkgname}/"
  install -d "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -r sql "${pkgdir}/usr/share/doc/${_pkgname}/"
  install -Dm 644 README.txt "${pkgdir}"/usr/share/doc/${_pkgname}/README
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${_pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
