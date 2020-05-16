# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: David Baum <david.baum@naraesk.eu>

pkgname=luminance-git
_pkgname=luminance
pkgver=0.1.0.r0.g33a274c
pkgrel=1
epoch=
pkgdesc="Luminance is a Philips Hue client for Linux written in Python and GTK+"
arch=('any')
url="https://github.com/craigcabrey/luminance"
license=('GPL2')
depends=('python' 'dconf' 'hicolor-icon-theme' 'python-phue')
makedepends=('git' 'autoconf' 'python' 'python-requests' 'gtk3' 'pygobject-devel')
provides=('luminance=$pkgver')
conflicts=('luminance')
source=('git+https://github.com/craigcabrey/luminance.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}


build() {
  cd "${srcdir}/${_pkgname}" 
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}" 
  make DESTDIR="$pkgdir/" install
}
