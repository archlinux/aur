# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Michael Lass <bevan@bi-co.net>


pkgname=phpdocumentor2
_pkgreal=phpDocumentor
pkgver=2.9.0
pkgrel=1
pkgdesc="Documentation Generator for PHP"
arch=('any')
url="http://www.phpdoc.org/"
license=('custom')
depends=('php' 'graphviz' 'php-xsl')
conflicts=('phpdocumentor')
install=$pkgname.install
source=("https://github.com/${_pkgreal}/${_pkgreal}2/releases/download/v${pkgver}/${_pkgreal}-${pkgver}.tgz"
        "${pkgname}.install")
sha256sums=('72f2c2810c365341a320fb5dc883c8d41b941cb4da003f7e67a4a7a13bb5a56c'
            'b6066d62de3b131ac4d71a13eea8c6419f62282c7e229dc55b06acf0c8b5b60a')

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
