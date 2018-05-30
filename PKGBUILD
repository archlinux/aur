# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

pkgname=('zarafa-spamhandler')
groups=('zarafa')
pkgver=0.1
pkgrel=3
pkgdesc="Spamhandler for Zarafa"
arch=('armv7h'
      'armv6h'
      'x86_64'
      'i686')
url="https://documentation.zarafa.com/zcp_python_zarafa/"
license=('AGPL3')
depends=('zarafa-server'
	 'python2'
	 'spamassassin')
makedepends=('git')
source=("${pkgname}::git+https://github.com/zarafagroupware/python-zarafa.git"
	"zarafa-spamhandler.service"
	"zarafa-spamhandler.timer"
	"zarafa-spamhandler.cfg")
md5sums=('SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP')

package() {
    cd ${srcdir}/${pkgname}/scripts/zarafa-spamhandler

    mkdir -p ${pkgdir}/etc/${pkgname}
    mkdir -p ${pkgdir}/usr/share/${pkgname}
    mkdir -p ${pkgdir}/usr/lib/systemd/system

    cp ${srcdir}/zarafa-spamhandler.cfg ${pkgdir}/etc/${pkgname}/
    ln -s /etc/${pkgname}/zarafa-spamhandler.cfg ${pkgdir}/usr/share/${pkgname}/

    cp zarafa-spamhandler.py ${pkgdir}/usr/share/${pkgname}/
    
    cp ${srcdir}/zarafa-spamhandler.service ${pkgdir}/usr/lib/systemd/system/
    cp ${srcdir}/zarafa-spamhandler.timer ${pkgdir}/usr/lib/systemd/system/
}
