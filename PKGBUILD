# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=folder-color-common
_pkgname=${pkgname%-common}
pkgver=0.1.3
pkgrel=1
pkgdesc="Icons and translations for Folder Color"
arch=('any')
url="https://github.com/costales/folder-color"
license=('GPL3')
depends=('python' 'hicolor-icon-theme')
makedepends=('dpkg' 'git' 'python-distutils-extra')
conflicts=("$_pkgname-bzr")
_commit=bc409f76aff08e50a16d0ec48a900e968bf41b97
source=("git+https://github.com/costales/folder-color.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  dpkg-parsechangelog --show-field Version
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # the following files are not recognized by DistUtilsExtra.auto:
  install -d "$pkgdir/usr/share/locale"
  cp -r build/mo/* "$pkgdir/usr/share/locale"

  cp -r icons "$pkgdir/usr/share/"
}
