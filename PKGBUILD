# Maintainer: Justin Dray <justin@dray.be>

pkgname=couchpotato
_pkgname=CouchPotato
pkgver=2.6.3
_fullname=CouchPotatoServer-build-${pkgver}
pkgrel=1
pkgdesc="Automatic Movie Downloading via NZBs & Torrent"
arch=('any')
url="http://couchpota.to/"
license=('GPL3')
depends=('python2')
install='couchpotato.install'
source=("https://github.com/RuudBurger/CouchPotatoServer/archive/build/${pkgver}.tar.gz"
        "${pkgname}.service"
	"${pkgname}-confd.conf"
	"${pkgname}.sh"
	"${pkgname}-tmpfiles.conf")
md5sums=('a2a39b1807828fd515ee71babc5a935d' 'af10d8c2e347005ee2ff465865456107' '42ec6846a96efdf6524d7905b3f03393' '48126ad1674d4679c2a645dfb9d5a2c2' 
'95ebd431433b87d88c7a48cf0a32be7d')

package() {
  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -d "${pkgdir}/var/lib/${pkgname}"

  cp -r "${srcdir}/${_fullname}/"* "${pkgdir}/usr/lib/${pkgname}"

  find "${pkgdir}/usr/lib/${pkgname}" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/lib/${pkgname}" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/usr/lib/${pkgname}/${_pkgname}.py"

  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm640 "${srcdir}/${pkgname}-confd.conf" "${pkgdir}/etc/conf.d/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
