# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=dovecot2-antispam-git
pkgver=v2.0.11.g963c046
pkgrel=1
pkgdesc="Integrates DSPAM into dovecot IMAP server. Git Version for dovecot >= 2.1"
arch=( 'i686' 'x86_64' )
url="http://hg.dovecot.org/dovecot-antispam-plugin/"
license=('GPL')
depends=('dovecot>=2.2.0')
makedepends=('git')
conflicts=(dovecot-antispam)
provides=(dovecot-antispam)
source=('dovecot2-antispam-git::git+http://git.sipsolutions.net/dovecot-antispam.git/')
md5sums=('SKIP')

pkgver() {
        cd ${srcdir}/${pkgname}
        git describe --always | sed 's|-|.|g'
}

build() {
  cd ${srcdir}/${pkgname}
  msg "Starting make..."
  make 
  #./configure --prefix=/usr --with-dovecot=/usr/lib/dovecot
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/lib/dovecot/modules"
  make INSTALLDIR="${pkgdir}/usr/lib/dovecot/modules" install
} 
