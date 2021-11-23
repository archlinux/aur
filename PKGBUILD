# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=mounch
pkgver=0.6.1
pkgrel=1
pkgdesc="A simple rofi based launcher based on yaml config"
arch=('any')
url="https://github.com/chmouel/${pkgname}"
license=('Apache')
groups=('utils')
depends=('python>=3.6' 'python-yaml' 'rofi')
makedepends=('python-setuptools')
source=("${pkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/mounch/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('a071c8ea4fa4c1492d5ff85f45dfed140adc39b85e8673d1a648f6e69d01225e9fce51c3dcd144183201ce543c82fb27f3539aa680617fb78d2e37ce7fe4b4fc')


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

