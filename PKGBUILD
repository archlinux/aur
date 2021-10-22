# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-degiro-connector"
pkgver=2.0.3
pkgrel=1
pkgdesc="Yet another library to access Degiro's API"
url="https://github.com/Chavithra/degiro-connector"
license=("BSD-3")
arch=("any")
provides=("degiro-connector")
replaces=("python-degiro-connector")
conflicts=("python-degiro-connector")
# not adding "python-orjson" because it is not compatible with ARM architectures yet
depends=("python-grpcio" "python-onetimepass" "python-pandas" "python-protobuf" "python-requests" "python-wrapt")
makedepends=("python-dephell" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Chavithra/degiro-connector/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c07eddb361e0e5cc58f335e27197865749e0f48e815bf1b7f2c09bbed2d024e0')

prepare(){
 cd "degiro-connector-$pkgver"
 # use plain json because orjson is not compatible with ARM architectures yet
 find . -type f -not -path "*/.git/*" -exec sed -i {} -e "s/import orjson as json/import json/g" -e "s/'orjson',/#'orjson',/g" \;
 dephell deps convert --from pyproject.toml --to setup.py
}

build(){
 cd "degiro-connector-$pkgver"
 python setup.py build
}

package(){
 cd "degiro-connector-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
