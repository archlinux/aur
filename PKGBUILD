# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-fastavro
_name=${pkgname#python-}
pkgver=1.9.4
pkgrel=1
pkgdesc="Fast read/write of AVRO files"
arch=("any")
url="https://github.com/fastavro/fastavro"
license=("MIT")
depends=("glibc" "python" "python-cramjam" "python-lz4" "python-snappy" "python-zstandard")
makedepends=("cython" "python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('5d9454b6ee932661b768b3f637fb6f8fc2f49f54cb215ef74c8bff81ac927670f2219d29d58c0225d6adc94b13fefbe5cdd59a7fea856e09f0a69f1be6a413b7')

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
