# Contributor: Bogdan Szczurek <thebodzio@gmail.com>
# Contributor: Axper Jan <483ken _at_ gmail
_gitname=udis86
pkgname=${_gitname}-git
pkgver=1.7.2.84.g56ff6c8
pkgrel=1
pkgdesc="Disassembler library for x86"
arch=('i686' 'x86_64')
url="http://${_gitname}.sourceforge.net"
license=('custom:BSD-2-clause')
depends=()
makedepends=(git python2)
provides=(${_gitname})
conflicts=(${_gitname})
source=(git+https://github.com/vmt/${_gitname}.git)
sha512sums=('SKIP')

pkgver() {
  cd ${_gitname}
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g;s|^v||'
}

build() {
  cd ${_gitname}
  # Building...
  ./autogen.sh
  ./configure --prefix=/usr --with-python=/usr/bin/python2
  make
}

package() {
  cd ${_gitname}
  make DESTDIR=${pkgdir} install
  # Taking care of the license
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
