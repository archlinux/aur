# Maintainer: Philipp Claßen <philipp.classen@posteo.de>

pkgname=python-confluent_kafka
_pkgname=confluent-kafka-python
pkgver=1.5.0
pkgrel=1
pkgdesc="Confluent's Kafka Python Client"
arch=('x86_64')
license=('Apache')
url="https://github.com/confluentinc/confluent-kafka-python"
depends=('python' 'librdkafka')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/confluentinc/confluent-kafka-python/archive/v${pkgver}.tar.gz")
sha512sums=('8ac0e021a85932eef4034940d0d620788753ccc585e5b26f066ae62e4db5a5595e16a40e6f6a70160ee9f43e7fbe3c99416c68f844cc737cdf762bda7c0a0bb4')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py clean
	rm -rf build dist
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	rm "${pkgdir}/usr/LICENSE.txt"
}
