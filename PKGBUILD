# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=ddclient-curl
pkgver=3.8.3
_releasenumber='07'
pkgrel=1
pkgdesc="A fork of ddclient using curl to update dynamic DNS entries for accounts on many dynamic DNS services."
url="https://github.com/astlinux-project/ddclient-curl"
arch=('any')
license=('GPL2')
backup=('etc/ddclient/ddclient-curl.conf')
depends=('perl-digest-sha1'
         'iproute2')

source=(
  "ddclient-curl-${pkgver}-${_releasenumber}.tar.gz::https://github.com/astlinux-project/ddclient-curl/archive/${pkgver}-${_releasenumber}.tar.gz"
  'ddclient-curl.service'
)

sha512sums=('a9a3b947929888dbc5c87067ed584978cfcf6749f0559b619d626eb52c5f6b394f98b5ac0f3c4cd59ed840c562882403e38e90e17819bf70e41aa097b2ed936d'
            '1befe6765b976a2ccb896d8dd22d89f119ab6dfa29eca7316be3d78f6e8ad8046941f08661a65515143a3c650e75e442dc9dccc5fbc102e44787c03d54203e35')

package() {
  cd "ddclient-curl-${pkgver}-${_releasenumber}"
  install -D -m 755 ddclient "${pkgdir}/usr/bin/${pkgname}"
  install -d "${pkgdir}/var/cache/ddclient"
  install -D -m 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m 644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  install -D -m 644 "${srcdir}/ddclient-curl.service" "${pkgdir}/usr/lib/systemd/system/ddclient-curl.service"
}
