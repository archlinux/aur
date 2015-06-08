# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=phpdocumentor2
_pkgreal=phpDocumentor
pkgver=2.8.2
pkgrel=1
pkgdesc="Documentation Generator for PHP"
arch=('any')
url="http://www.phpdoc.org/"
license=('custom')
depends=('graphviz' 'php-xsl')
conflicts=('phpdocumentor')
install=$pkgname.install
source=("http://pear.phpdoc.org/get/${_pkgreal}-${pkgver}.tgz"
        "${pkgname}.install")
sha256sums=('77446ce240393a798fdf092c28c8f0bad2004c7588e338aa3acd320eac0dc20a'
            'b6066d62de3b131ac4d71a13eea8c6419f62282c7e229dc55b06acf0c8b5b60a')

package() {
	# Install main application
	install -dm755 ${pkgdir}/usr/share/webapps
	mv ${srcdir}/${_pkgreal}-${pkgver} ${pkgdir}/usr/share/webapps/${pkgname}
	chmod -R a+r ${pkgdir}/usr/share/webapps/${pkgname}

	# Move LICENSE, README and CONTRIBUTING
	install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
        install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
	mv ${pkgdir}/usr/share/webapps/${pkgname}/LICENSE \
		${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
        mv ${pkgdir}/usr/share/webapps/${pkgname}/README.md \
                ${pkgdir}/usr/share/doc/${pkgname}/README
        mv ${pkgdir}/usr/share/webapps/${pkgname}/CONTRIBUTING.md \
                ${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING

	install -dm755 ${pkgdir}/usr/bin
	ln -s /usr/share/webapps/${pkgname}/bin/phpdoc ${pkgdir}/usr/bin/phpdoc
}
