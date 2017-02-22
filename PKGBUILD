# Maintainer: willemw <willemw12@gmail.com>

_pkgname=scanpy
pkgname=$_pkgname-git
pkgver=0.1_104.0f1981e
pkgrel=1
pkgdesc=''
arch=('any')
url='https://github.com/theislab/scanpy'
license=('GPL3')
depends=(
	'python-matplotlib'
	'python-pandas'
	'python-scipy'
	'python-xlrd'
	'python-h5py'
	'python-scikit-learn')
source=($_pkgname::git://github.com/theislab/scanpy.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "0.1_%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	#git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
