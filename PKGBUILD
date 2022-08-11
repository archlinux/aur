# Maintainer: libele <libele@disroot.org>
# Contributor: Christian Hesse <mail@eworm.de>

pkgname=hgweb
pkgver=6.2.1
pkgrel=1
pkgdesc='Mercurial web interface'
arch=('any')
url='https://mercurial-scm.org/'
license=('GPL')
depends=('mercurial' 'python')
source=("https://mercurial-scm.org/release/mercurial-${pkgver}.tar.gz"
	'hgweb.conf')
backup=('etc/conf.d/hgweb.conf')
sha256sums=('8ac5d7a20d1c2ad54d4c263d134164646dc34a8e3a6bed69cfbeabaf8d3882da'
            'ceccc16a49d074f4981297041f0f526c04838cd8541ecc891d87513f8a8ba62f')

build() {
	sed -i -e '/^config/c config = b"/etc/conf.d/hgweb.conf"' ${srcdir}/mercurial-${pkgver}/hgweb.cgi
}

package() {
	install -Dm755 ${srcdir}/mercurial-${pkgver}/hgweb.cgi ${pkgdir}/usr/share/webapps/hgweb/hgweb.cgi
	install -Dm644 ${srcdir}/hgweb.conf ${pkgdir}/etc/conf.d/hgweb.conf
}

