# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-shortid"
_name="shortid"
pkgver=0.1.2
pkgrel=1
pkgdesc="Short id generator"
arch=(any)
url="https://github.com/corpix/shortid"
license=("MIT")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('2b00299bda5c96f40e06707814f42a56c1daebe2e7fa2d889af045b1a2b7d6883c679bcd08329d2778f106f8b014c1b6f321b7fa0cd6549abea5f0a80f98998a')
options=("!strip")

prepare(){
 cd "$_name-$pkgver"
 sed -i "setup.cfg" \
     -e "s|description-file|description_file|"
}

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
