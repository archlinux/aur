# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-avro
pkgver=1.12.0
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
b2sums=('393f918c047bed572bcb1803870a7bafe29d0a14c82d2da082665a4d72bd6277bf0410e4349ca43a320682f4ebd2742b5a3262fe86e5ed861fcf1c0e49a8c778')

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
