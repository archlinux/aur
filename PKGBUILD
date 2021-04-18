# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-degiro-connector-git"
pkgver=0.0.9.r2.g75db936
pkgrel=1
pkgdesc="Yet another library to access Degiro's API"
url="https://github.com/Chavithra/degiro-connector"
license=("BSD-3")
arch=("any")
provides=("degiro-connector" "python-degiro-connector")
# not adding "python-orjson" because it is not compatible with ARM architectures yet
depends=("python-grpcio" "python-onetimepass" "python-pandas" "python-protobuf" "python-requests" "python-wrapt")
makedepends=("python-setuptools" "python-wheel")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "degiro-connector"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare(){
 # use plain json because orjson is not compatible with ARM architectures yet
 find "degiro-connector" -type f -not -path "*/.git/*" -exec sed -i {} -e "s/import orjson as json/import json/g" -e "s/'orjson',/#'orjson',/g" \;
}

build(){
 cd "degiro-connector"
 python setup.py build
}

package(){
 cd "degiro-connector"
 python setup.py install --root="$pkgdir" --optimize=1
}
