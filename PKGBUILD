# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=mounch
pkgver=0.9.0
pkgrel=1
pkgdesc="A simple rofi based launcher based on yaml config"
arch=('any')
url="https://github.com/chmouel/${pkgname}"
license=('Apache')
groups=('utils')
depends=('python>=3.6' 'python-yaml' 'rofi')
makedepends=('python-setuptools')
source=("${pkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/mounch/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('7f08355c271f4ced4f72a5327a1626446c8d865f1f8664e21838ecc8c8ce298447db3853b9eaafccb212eb7d73b675e6607f244714ceb0d4943f4dabc5768bcf')


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

