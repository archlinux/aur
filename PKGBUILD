# Maintainer: FrozenCow <frozencow@gmail.com>

pkgname=protoc-gen-doc-git
_gitname=protoc-gen-doc
pkgver=213.d71828a
pkgrel=1
pkgdesc="A documentation generator plugin for Google Protocol Buffers."
arch=('i686' 'x86_64')
url="https://github.com/estan/protoc-gen-doc"
depends=('qt5-base')
makedepends=('qt5-base')
license=('LGPL')
source=("git+https://github.com/estan/protoc-gen-doc.git")
sha256sums=('SKIP')

pkgver() {
    cd $_gitname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_gitname}"
  qmake PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make INSTALL_ROOT="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/"
}
