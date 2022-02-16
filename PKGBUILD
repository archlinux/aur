# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Maintainer: Alexandre Janniaux <ajanni@videolabs.io>

pkgname=medialibrary-git
pkgver=4692.725ff59a
pkgrel=1
pkgdesc="VideoLAN Media Library"
arch=('i686' 'x86_64')
url="https://code.videolan.org/videolan/medialibrary"
license=('GPL')
depends=('vlc' 'libvlcpp' 'libjpeg-turbo' 'sqlite')
makedepends=('git' 'meson')
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

  meson setup \
      --prefix=/usr/ --reconfigure --buildtype release \
      -Dtests=disabled build
  meson compile -C build
}

package() {
  cd "${srcdir}/${_gitname}"
  meson install -C build --destdir="${pkgdir}"
}
