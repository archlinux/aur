# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=hgweb
pkgver=3.4.1
pkgrel=1
pkgdesc='Mercurial web interface'
arch=('any')
url='http://mercurial.selenic.com/'
license=('GPL')
depends=('mercurial' 'python2')
source=("http://mercurial.selenic.com/release/mercurial-${pkgver}.tar.gz"
	'hgweb.conf')
backup=('etc/conf.d/hgweb.conf')
sha256sums=('7a8acf7329beda38ceea29c689212574d9a6bfffe24cf565015ea0066f7cee3f'
            'ceccc16a49d074f4981297041f0f526c04838cd8541ecc891d87513f8a8ba62f')

build() {
	sed -i -e '/#!/s|python|python2|' -e '/^config/c config = "/etc/conf.d/hgweb.conf"' ${srcdir}/mercurial-${pkgver}/hgweb.cgi
}

package() {
	install -D -m0755 ${srcdir}/mercurial-${pkgver}/hgweb.cgi ${pkgdir}/srv/http/hg/hgweb.cgi
	install -D -m0644 ${srcdir}/hgweb.conf ${pkgdir}/etc/conf.d/hgweb.conf
}

