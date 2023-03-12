# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=folder-color-nautilus
_pkgname=${pkgname%-nautilus}
pkgver=0.2.7
pkgrel=1
pkgdesc="Change your folder color in Nautilus"
arch=('any')
url="https://github.com/costales/folder-color"
license=('GPL3')
depends=('python-nautilus')
makedepends=('git' 'python-distutils-extra')
conflicts=("$_pkgname-bzr" 'folder-color-common')
replaces=('folder-color-common')
_commit=f75be7281db5d77ee0231dccc440f69838628805  # 0.2.7
source=("git+https://github.com/costales/folder-color.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  python setup.py --version
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
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
