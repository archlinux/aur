# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=mounch
pkgver=0.10.1
pkgrel=1
pkgdesc="A simple rofi based launcher based on yaml config"
arch=('any')
url="https://github.com/chmouel/${pkgname}"
license=('Apache')
groups=('utils')
depends=('python>=3.6' 'python-yaml' 'rofi')
makedepends=('python-setuptools')
source=("${pkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/mounch/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('91946c6820d9e8c69ed0cf134c6f1838e512798c8cb38e1e4518c3b63efb6fcdeaf5beae391a85c9ec2301edbaa0380fe2f68b982ef6be63cd7d7f33757434ac')


package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

    # install binary
	install -D -m0755 ${pkgname}.py "${pkgdir}/usr/bin/${pkgname}"

	# Configuration file.
	install -D -m0644 ${pkgname}.yaml "${pkgdir}/usr/share/doc/${pkgname}/config.example.yaml"

    # Rofi theme
	install -D -m0644 rofi/${pkgname}.rasi "${pkgdir}/usr/share/rofi/themes/${pkgname}.rasi"


	# Helpers
    for file in helpers/*;do
	    install -D -m0644 ${file} "${pkgdir}/usr/share/${pkgname}/${file}"
    done    
    install -D -m0644 rofi/rofipassgen.sh "${pkgdir}/usr/share/${pkgname}/rofipassgen.sh"
}

