# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: John Jenkins twodopeshaggy@gmail.com
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Asa Marco <marcoasa90<at>gmail[.]com>
# Contributor: Felix Rohrbach <fxrh@gmx.de>
# Contributor: Jorge Araya AKA Shackra <jorgean@lavabit.com>

pkgname=vlmc-git
epoch=1
pkgver=0.4358.9ad256c1
pkgrel=1
pkgdesc="VideoLAN Movie Creator, a simple and user-friendly video editor"
arch=('i686' 'x86_64')
url="http://vlmc.org/"
license=('GPL')
depends=('vlc' 'frei0r-plugins' 'libvlcpp-git' 'medialibrary-git')
makedepends=('git' 'gcc-objc' 'qt5-tools')
source=(
  'git+https://code.videolan.org/videolan/vlmc.git'
)

sha256sums=(
  'SKIP'
)
provides=('vlmc')
conflicts=('vlmc')
_gitname="vlmc"

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo "0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}


build() {
  cd "${srcdir}/${_gitname}"
  git submodule init
  git submodule update

  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make "DESTDIR=${pkgdir}" install
}
