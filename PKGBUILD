# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=plumb
pkgname=python-${_pyname,,}
pkgver=1.2.5
pkgrel=2
pkgdesc='Connect systems via many brokers such as Kafka, AWS SQS, RabbitMQ and more'
arch=(any)
url="https://pypi.org/project/$_pyname"
license=(MIT)
_pydeps=(boto3
         botocore
         confluent_kafka
         dateutil
         pika
         redis)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('05ec1666dae8dffb78bdfe469a3cb5df12b4209e445e3cee193c0f24ec0bce5e')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
