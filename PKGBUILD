# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Michael Lass <bevan@bi-co.net>


pkgname=phpdocumentor2
_pkgreal=phpDocumentor
pkgver=2.8.5
pkgrel=2
pkgdesc="Documentation Generator for PHP"
arch=('any')
url="http://www.phpdoc.org/"
license=('custom')
depends=('php56' 'graphviz' 'php56-xsl')
conflicts=('phpdocumentor')
install=$pkgname.install
source=("http://pear.phpdoc.org/get/${_pkgreal}-${pkgver}.tgz"
        "${pkgname}.install")
sha256sums=('17b20d7648392e72064590347f6092f80d67f8c418d759ed54982716dfafebf2'
            'b6066d62de3b131ac4d71a13eea8c6419f62282c7e229dc55b06acf0c8b5b60a')

prepare() {
	cd ${srcdir}/${_pkgreal}-${pkgver}
	sed -i -e '1s|/usr/bin/env php$|/usr/bin/env php56|' bin/phpdoc
}

package() {
	# Install main application
	install -dm755 ${pkgdir}/usr/share/webapps
	cp -r ${srcdir}/${_pkgreal}-${pkgver} ${pkgdir}/usr/share/webapps/${pkgname}
	chmod -R a+r ${pkgdir}/usr/share/webapps/${pkgname}

	# Move LICENSE, README and CONTRIBUTING
	#install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
        #install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
	install -Dm644 ${pkgdir}/usr/share/webapps/${pkgname}/LICENSE \
		${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
        install -Dm644 ${pkgdir}/usr/share/webapps/${pkgname}/README.md \
                ${pkgdir}/usr/share/doc/${pkgname}/README
        install -Dm644 ${pkgdir}/usr/share/webapps/${pkgname}/CONTRIBUTING.md \
                ${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING

	install -dm755 ${pkgdir}/usr/bin
	ln -s /usr/share/webapps/${pkgname}/bin/phpdoc ${pkgdir}/usr/bin/phpdoc
}
