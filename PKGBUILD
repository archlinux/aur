# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=plumb
pkgname=python-${_pipname,,}
pkgver=1.2.5
pkgrel=1
pkgdesc='Connect systems via many brokers such as Kafka, AWS SQS, RabbitMQ and more'
arch=('any')
url="https://pypi.org/project/$_pipname"
license=('MIT')
_py_deps=('boto3'
          'botocore'
          'confluent_kafka'
		  'dateutil'
          'pika'
		  'redis')
depends=('python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('05ec1666dae8dffb78bdfe469a3cb5df12b4209e445e3cee193c0f24ec0bce5e')

build() {
    cd "$_pipname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
