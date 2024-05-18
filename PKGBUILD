# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-avro
pkgver=1.11.3
pkgrel=1
pkgdesc="Avro is a serialization and RPC framework."
arch=(any)
url="https://avro.apache.org/"
license=('Apache-2.0')
depends=('python'
         'python-zstandard'
         'python-snappy')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/a/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz")
b2sums=('3fbd8ea80eeea212e9136207c5207af5571ad74e21d5ab469fc1a86525cffb2f80477757be8b63cd026d9b75ec596d30b2c1bdf4abba6b15711cd3dffafcf80e')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 avro/LICENSE -t "$pkgdir/usr/share/$pkgname/"
}
