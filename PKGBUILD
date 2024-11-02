# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-fastavro
_name=${pkgname#python-}
pkgver=1.9.7
pkgrel=1
pkgdesc="Fast read/write of AVRO files"
arch=("any")
url="https://github.com/fastavro/fastavro"
license=("MIT")
depends=("glibc" "python" "python-cramjam" "python-lz4" "python-snappy" "python-zstandard")
makedepends=("cython" "python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('474c9b775ab7681b6e717f7ff9fa8907547f1f1e3acabccd1a85c067fd9d382696cb5d23d070a0720536951748b168b3daf882c3febf35ee0b5b6fc618de51ac')

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
