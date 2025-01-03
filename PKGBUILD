# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-fastavro
_name=${pkgname#python-}
pkgver=1.10.0
pkgrel=1
pkgdesc="Fast read/write of AVRO files"
arch=("any")
url="https://github.com/fastavro/fastavro"
license=("MIT")
depends=("glibc" "python" "python-cramjam" "python-lz4" "python-snappy" "python-zstandard")
makedepends=("cython" "python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('71aee188e97223226363b39b57cb5a39c2e5afab0cc8f4da40a4d7dbde7e66160c8b3762ee78e9a43158e9e91a8b9bfdfa96994cbe3861b57f328d80d5749248')

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
