# Maintainer: Clément DEMOULINS <clement@archivel.fr>

pkgname=arandr-gtk3-git
_realname=arandr
pkgver=0.1.r0.gaf211d1
pkgrel=1
pkgdesc="Provide a simple visual front end for XRandR 1.2. GTK3 port."
arch=('any')
url="https://github.com/actionless/arandr"
license=('GPL3')
depends=('python-gobject' 'desktop-file-utils' 'xorg-xrandr')
makedepends=('docutils' 'git')
conflicts=('arandr' 'arandr-git')
provides=('arandr')
install=$pkgname.install

source=(git+"$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_realname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_realname}"
  python setup.py build
}

package() {
  cd "$srcdir/${_realname}"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

