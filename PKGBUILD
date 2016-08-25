# Maintainer: John Jenkins twodopeshaggy@gmail.com
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Asa Marco <marcoasa90<at>gmail[.]com>
# Contributor: Felix Rohrbach <fxrh@gmx.de>
# Contributor: Jorge Araya AKA Shackra <jorgean@lavabit.com>

pkgname=libvlcpp-git
epoch=1
pkgver=0.268.ac76311
pkgrel=1
pkgdesc="C++ bindings for libvlc"
arch=('i686' 'x86_64')
url="http://vlmc.org/"
license=('GPL')
depends=('vlc')
makedepends=('git')
source=(
  'git+https://code.videolan.org/videolan/libvlcpp.git'
)

sha256sums=(
  'SKIP'
)
provides=('libvlcpp')
conflicts=('libvlcpp')
_gitname="libvlcpp"

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo "0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}


build() {
  cd "${srcdir}/${_gitname}"

  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make "DESTDIR=${pkgdir}" install
}
