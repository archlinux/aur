# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-fastavro
_name=${pkgname#python-}
pkgver=1.11.1
pkgrel=1
pkgdesc="Fast read/write of AVRO files"
arch=("any")
url="https://github.com/fastavro/fastavro"
license=("MIT")
depends=("glibc" "python" "python-cramjam" "python-lz4" "python-snappy" "python-zstandard")
makedepends=("cython" "python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('42ca8d873ba8dfde82efd681ac3ec124eae8bbe41e574d962885dba4c5641da139375cfb7b6ed3c000d9d3fb91920625315281987f55e2a8d18d772784dc64c1')

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
