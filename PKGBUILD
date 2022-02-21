# Python package author: Christopher Ritsen <chris.ritsen@gmail.com>
# 
# build() {
#   pip install --no-deps --target="netaudio" netaudio=="$pkgver"
# }
# 
# package() {
#   sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
#   mkdir -p $pkgdir/"$sitepackages"
#   mv $srcdir/$_name/bin $pkgdir/usr
#   cp -r $srcdir/$_name/* $pkgdir/"$sitepackages"
# }

_name=netaudio
_pkgdirname="${_pkgname}"
_pkgname="python-${_name}"

arch=(any)
depends=('python' 'python-cleo' 'python-netifaces' 'python-pip' 'python-twisted' 'python-zeroconf')
license=(Unlicense)
makedepends=('python-setuptools')
pkgdesc="Control Dante network audio devices without Dante Controller"
pkgname="${_pkgname}"
pkgrel=3
pkgver=0.0.3
sha256sums=('1a577c8097ee4ca047b143f7063540e222ce565320b62f534fc9c78a944813c0')
source=("https://files.pythonhosted.org/packages/e5/a7/f81b2f82d3dccb0b7ad7ddbf3619746594b8345b78c4c0adbeea6c97bb09/${_name}-${pkgver}.tar.gz")
url="https://github.com/chris-ritsen/network-audio-controller"
url='https://github.com/chris-ritsen/network-audio-controller'

prepare() {
   rm -rf ${_name}-${pkgver}/*.egg-info
}

build() {
   cd ${_name}-${pkgver}
   python setup.py build
}

package() {
   cd ${_name}-${pkgver}
   python setup.py install --root="$pkgdir" --optimize=1 --skip-build
   # install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
