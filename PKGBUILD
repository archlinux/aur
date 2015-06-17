# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: Frédérik Paradis <fredy14[at]gmail[dot]com>

_gitname=libforensic1394
pkgname=libforensic1394-git
pkgver=0.2.r14.g1193ac1
pkgrel=1
pkgdesc="An open source library for performing live memory forensics over the IEEE 1394 (“FireWire”) interface."
url="https://freddie.witherden.org/tools/libforensic1394/"
arch=('x86_64' 'i686')
license=('LGPL3')
depends=('python')
optdepends=()
makedepends=('cmake' 'gcc' 'git')
provides=('libforensic1394')
conflicts=('libforensic1394')
replaces=()
backup=()
source=("$_gitname"::'git+https://github.com/FreddieWitherden/libforensic1394.git')
sha512sums=('SKIP')

pkgver() {
    cd "$startdir/$_gitname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"
  cmake -DCMAKE_INSTALL_PREFIX="/usr" CMakeLists.txt
}

package() {
  cd "${srcdir}/${_gitname}"

  make DESTDIR="${pkgdir}" install

  cd python
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
