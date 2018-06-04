# Maintainer: Gunnar Waterstraat <gunnar.waterstraat@gmx.de>
pkgname=python2-nibabel-git
pkgver=2.2.1.r228.g2edca761
pkgrel=1
pkgdesc="Python package to access a cacophony of neuro-imaging file formats"
arch=('any')
url="http://nipy.org/nibabel/"
license=('MIT' 'custom')
depends=('python2>=2.7' 'python2-numpy>=1.7.1' 'python2-six>=1.3')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('nibabel::git+http://github.com/nipy/nibabel.git')
md5sums=('SKIP')

pkgver() {
  cd nibabel
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "nibabel"
	python2 setup.py build
}

package() {
	cd "nibabel"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
