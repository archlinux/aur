# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=mounch
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple rofi based launcher based on yaml config"
arch=('any')
url="https://github.com/chmouel/${pkgname}"
license=('Apache')
groups=('utils')
depends=('python>=3.6' 'python-yaml' 'rofi')
makedepends=('python-setuptools')
source=("${pkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/mounch/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('b059b62488b04789fd1414788675eee560017dae3ad9442cda8202fb34dcfc542fbb73f0eecd32fd38c91e16f0981db4e8214df305a8b8e5aecca1903bca5120')


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

