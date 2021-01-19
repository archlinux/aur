# Maintainer: Tim Yang <protonmail = timdyang>
# Contributor: Philippe Hürlimann <p@hurlimann.org>

pkgbase=python-virtualbox
pkgname=(python-virtualbox python2-virtualbox)
pkgver=2.1.1
pkgrel=1
pkgdesc="A complete implementation of VirtualBox's COM API with a Pythonic interface"
arch=(any)
url=https://github.com/sethmlarson/virtualbox-python
license=(Apache)
depends=(virtualbox-sdk)
makedepends=(python2-setuptools python-setuptools)
source=(https://github.com/sethmlarson/virtualbox-python/archive/v$pkgver.tar.gz)
sha256sums=(0a2abaee78e1ad41983f009b6c675ae2f0c24e725d227bb9d4ba0c35570a53f7)

prepare() {
  cd "$srcdir"
  cp -a virtualbox-python{,2}-$pkgver
}

build() {
  cd "$srcdir"/virtualbox-python-$pkgver
  python3 setup.py build

  cd "$srcdir"/virtualbox-python2-$pkgver
  python2 setup.py build
}

package_python-virtualbox() {
  cd "$srcdir"/virtualbox-python-$pkgver
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-virtualbox() {
  cd "$srcdir"/virtualbox-python2-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
