# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=dovecot-xaps-daemon-git
_gitname=dovecot-xaps-daemon
pkgver=60.612d6af
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - xaps daemon'
arch=('any')
url='https://github.com/st3fan/dovecot-xaps-daemon'
license=('MIT')
makedepends=('git' 'gb')
provides=('dovecot-xaps-daemon')
conflicts=('dovecot-xaps-daemon')
backup=('etc/xapsd/xapsd.conf')
source=(git+https://github.com/st3fan/dovecot-xaps-daemon.git
		    xapsd.conf
		    xapsd.service)
sha512sums=('SKIP'
            '0d7971781ecb1ff545045ca098a99113aad563217cba0267c5eb8f9e684616a8a47ebfdd35f9b7af2911c480e0ca68f2120a14a8d791d2ddbd6d79e34dcd052b'
            '78a5b191055d562bad533cd94e8cf5a7ea6c395a365516b98c256f2a281fa57fce1d0d1eed394e7e7cb701418657207524d08f807fd9eae44fcf8eafef2a8d1b')

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}/${_gitname}"
  gb build all
}

package() {
  install -dm755 "${pkgdir}/var/lib/xapsd/"

  install -Dm644 -t "${pkgdir}/etc/xapsd/" "${srcdir}/xapsd.conf"
  install -Dm755 -t "${pkgdir}/usr/bin/" "${srcdir}/${_gitname}/bin/xapsd"
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}/xapsd.service"
}
