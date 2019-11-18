# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=ddclient-curl
pkgver=3.8.3
_releasenumber='05'
pkgrel=1
pkgdesc="A fork of ddclient using curl to update dynamic DNS entries for accounts on many dynamic DNS services."
url="https://github.com/astlinux-project/ddclient-curl"
arch=('any')
license=('GPL2')
backup=('etc/ddclient/ddclient-curl.conf')
depends=('perl-digest-sha1'
         'iproute2')

source=(https://github.com/astlinux-project/ddclient-curl/releases/download/${pkgver}-${_releasenumber}/ddclient-curl-${pkgver}-${_releasenumber}.tar.gz
        ddclient-curl.service)

sha512sums=('5947d75c51b3944da969ff68a9b1a6a04dbdf8e757387228e8d71184e1b7302dcd7b397e5b23f24093fe8d83a988d521ea2b2f2e493f5029034159ab53d25f8b'
            '1befe6765b976a2ccb896d8dd22d89f119ab6dfa29eca7316be3d78f6e8ad8046941f08661a65515143a3c650e75e442dc9dccc5fbc102e44787c03d54203e35')

package() {
  cd "ddclient-curl-${pkgver}-${_releasenumber}"
  install -D -m 755 ddclient "${pkgdir}/usr/bin/${pkgname}"
  install -d "${pkgdir}/var/cache/ddclient"
  install -D -m 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m 644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  install -D -m 644 "${srcdir}/ddclient-curl.service" "${pkgdir}/usr/lib/systemd/system/ddclient-curl.service"
}
