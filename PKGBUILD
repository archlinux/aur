# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-avro
pkgver=1.12.1
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
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('7dc2be339d3cb10e593f76e08f2b9bed761b133d4f759d58b6703f543996dae5ba80b3bee82e7ac8c4e7a3f7118d746e7ab3e65fb5e7da7d6d42a1ed25848c45')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver" || exit
    python -m build --wheel --no-isolation
}

package(){
    cd "$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 avro/LICENSE -t "$pkgdir/usr/share/$pkgname/"
}
