# Maintainer: Miguel Revilla <yo@miguelrevilla.com>

pkgname=medialibrary-git
pkgver=1223.7aac382
pkgrel=1
pkgdesc="VideoLAN Media Library"
arch=('i686' 'x86_64')
url="http://vlmc.org/"
license=('GPL')
depends=('vlc' 'libvlcpp' 'libjpeg-turbo' 'sqlite')
makedepends=('git')
source=(
  'git+https://code.videolan.org/videolan/medialibrary.git'
)

sha256sums=(
  'SKIP'
)
provides=('medialibrary')
conflicts=('medialibrary')
_gitname="medialibrary"

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
