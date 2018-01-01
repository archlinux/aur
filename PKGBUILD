# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=dovecot-xaps-daemon
pkgver=0.5
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - xaps daemon'
arch=('any')
url='https://github.com/st3fan/dovecot-xaps-daemon'
license=('MIT')
makedepends=('git' 'gb')
conflicts=('dovecot-xaps-daemon-git')
source=(https://github.com/st3fan/dovecot-xaps-daemon/archive/v${pkgver}.tar.gz
		    xapsd.conf
		    xapsd.service)
sha512sums=('4daf7bbfa2b9f4f222871b73ec238c957dcd12f161f19b66bbb642d997f0e1c0755fd97a6f49b76e80c034f53b2130f5bc91e75e322df2c99ff00385fb2d27dd'
            '0d7971781ecb1ff545045ca098a99113aad563217cba0267c5eb8f9e684616a8a47ebfdd35f9b7af2911c480e0ca68f2120a14a8d791d2ddbd6d79e34dcd052b'
            '78a5b191055d562bad533cd94e8cf5a7ea6c395a365516b98c256f2a281fa57fce1d0d1eed394e7e7cb701418657207524d08f807fd9eae44fcf8eafef2a8d1b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  gb build all
}

package() {
  install -dm755 "${pkgdir}/var/lib/xapsd/"

  install -Dm644 -t "${pkgdir}/etc/xapsd/" "${srcdir}/xapsd.conf"
  install -Dm755 -t "${pkgdir}/usr/bin/" "${srcdir}/${pkgname}-${pkgver}/bin/xapsd"
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}/xapsd.service"
}
