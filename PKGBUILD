# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>

pkgname=mounch
pkgver=0.6.2
pkgrel=1
pkgdesc="A simple rofi based launcher based on yaml config"
arch=('any')
url="https://github.com/chmouel/${pkgname}"
license=('Apache')
groups=('utils')
depends=('python>=3.6' 'python-yaml' 'rofi')
makedepends=('python-setuptools')
source=("${pkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/chmouel/mounch/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('6d64a264b66f429bdc0d0aa6bd453a5a58e49e627f30766fe0661b038322ac0d7bb3174c0237ca1ca4b302afa23f6b2f3af67721d9277c11267c55cb545f6a17')


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

