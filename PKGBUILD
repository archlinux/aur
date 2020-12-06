# Maintainer: Ricky Liou <rliou92@gmail.com>
pkgname=python-umonitor-git
_gitname=python-umonitor
pkgver=r93.f741e62
pkgrel=1
pkgdesc="Dynamic monitor configuration"
arch=('i686' 'x86_64')
url="https://github.com/rliou92/python-umonitor"
license=('MIT')
depends=('python-daemon' 'libxcb')
makedepends=('git' 'python-setuptools')
# install=${_gitname}.install
source=("git://github.com/rliou92/${_gitname}.git")
md5sums=('SKIP')
conflicts=("umonitor-git")

pkgver() {
	cd $srcdir/$_gitname
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/$_gitname
	python setup.py build
}

package() {
	cd $srcdir/$_gitname
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	# license
	install -D -p -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
