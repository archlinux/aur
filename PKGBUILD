# Maintainer: Hao Zhang <hao [at] hao-zhang [dot] com>

pkgname=genx
pkgver=3.0.3
pkgrel=1
pkgdesc="X-ray and Neutron reflectivity fitting software"
arch=("i686" "x86_64")
url="http://genx.sourceforge.net/"
license=("GPL v3")
options=(!libtool)
depends=("python" "python-numpy" "python-scipy" "python-matplotlib" "python-h5py" "python-wxpython" "python-appdirs")
makedepends=("cython" "git")
source=(https://master.dl.sourceforge.net/project/genx/3.x.y/GenX%203.0.x/GenX-$pkgver.tar.gz)
sha256sums=("2646a993998a96d7be6082b9548ad8fe97a7996876fd0b80b3e2fa647a1b77b3")

build() {
  cd "$srcdir"/GenX-"$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir"/GenX-"$pkgver"
  python setup.py install --prefix=usr/ --root=$pkgdir
  sed -i $'s/\r$//' $pkgdir/usr/bin/genx
}
