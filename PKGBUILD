# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=dovecot-xaps-daemon-git
_gitname=dovecot-xaps-daemon
pkgver=55.9cd4414
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - xaps daemon'
url='https://github.com/st3fan/dovecot-xaps-daemon'
arch=('any')
license=('MIT')
depends=('dovecot')
makedepends=('git' 'gb')
source=("git+https://github.com/st3fan/dovecot-xaps-daemon.git"
		'xapsd.conf'
		'xapsd.service')
sha512sums=('SKIP'
            '0d7971781ecb1ff545045ca098a99113aad563217cba0267c5eb8f9e684616a8a47ebfdd35f9b7af2911c480e0ca68f2120a14a8d791d2ddbd6d79e34dcd052b'
            '0c301a6922fc8ffada1b8c4140d8c9491cf4b7b45d9090d5fda9905b5c00cd6814f2c0197e6806d61fa8cf3d94d99feab1f7c460b510df5949a642c7127362a2')
 
pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd ${srcdir}/${_gitname}
  gb build all
}

package() {
  install -d -m 755 ${pkgdir}/usr/bin/
  install -d -m 755 ${pkgdir}/etc/xapsd/
  install -d -m 755 ${pkgdir}/usr/lib/systemd/system/
  install -d -m 755 ${pkgdir}/var/lib/xapsd/

  install -D -m 755 ${srcdir}/${_gitname}/bin/xapsd ${pkgdir}/usr/bin/
  install -D -m 644 ${srcdir}/xapsd.conf ${pkgdir}/etc/xapsd/
  install -D -m 644 ${srcdir}/xapsd.service ${pkgdir}/usr/lib/systemd/system/
}
