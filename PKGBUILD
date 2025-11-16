# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-fastavro
_name=${pkgname#python-}
pkgver=1.12.1
pkgrel=1
pkgdesc="Fast read/write of AVRO files"
arch=("any")
url="https://github.com/fastavro/fastavro"
license=("MIT")
depends=("glibc" "python" "python-cramjam" "python-lz4" "python-snappy" "python-zstandard")
makedepends=("cython" "python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('2ebd733e12141b5bcfaf21166a4ce86073084ba52a9430594516b745a25c0719e4bb54705dd904e69fd270cd7737aa03ae7ced1ba9ed72e68f6c8a2f21200070')

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
