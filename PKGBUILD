# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=folder-color-nautilus
_pkgname=${pkgname%-nautilus}
pkgver=0.0.90
pkgrel=1
pkgdesc="Change your folder color in Nautilus"
arch=('any')
url="https://github.com/costales/folder-color"
license=('GPL3')
depends=('folder-color-common' 'nautilus' 'python-nautilus')
makedepends=('git' 'python-distutils-extra')
conflicts=("$pkgname-bzr" "$pkgname-git")
_commit=e76d1d92e2d1418fa1dcd3f418a8919a2842140d
source=("git+https://github.com/costales/folder-color.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "%s" "$(head -n 1 debian/changelog | cut -d'(' -f 2 | cut -d')' -f 1 | sed 's/-/./')"
}

prepare() {
	cd "$srcdir/$_pkgname/install_scripts"
	./nautilus.sh
}

build() {
	cd "$srcdir/$_pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
