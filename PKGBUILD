# Maintainer: Bogdan Sinitsyn <f1u77y@yandex.ru>
pkgname=simple-viewer-gl
pkgver=3.1.7
_pkgfilename="v$pkgver.tar.gz"
pkgrel=1
pkgdesc='Simple and tiny image viewer based on OpenGL'
arch=('i686' 'x86_64')
url='https://bitbucket.org/andreyu/simple-viewer-gl'
license=('GPL2')
depends=(
  glfw
  # libjpeg
  # libpng
  # giflib
  # libtiff
  libwebp
  # freetype2
  # lcms2
  # zlib
  libexif
  # libxrandr
  # libxcursor

# Could be opt out
  openjpeg2
  imlib2
  openexr
  curl

  hicolor-icon-theme
  desktop-file-utils
)
makedepends=(
  cmake
)
optdepends=(
  # 'imlib2: Common formats support'
  # 'openexr: OpenEXR support'
)
conflicts=(
  "${pkgname}-git"
)
source=("https://bitbucket.org/andreyu/simple-viewer-gl/get/$_pkgfilename")
md5sums=('SKIP')

prepare() {
  cd "$srcdir"
  rm -rf "$pkgname"
  mv *"$pkgname"* "$pkgname"
}

build() {
  cd "$srcdir/$pkgname"

  make release
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" PREFIX="/usr/" install
  install -m 755 -d "$pkgdir/usr/share/applications/"
  install -m 644 sviewgl.desktop "$pkgdir/usr/share/applications/"
  install -m 755 -d "$pkgdir/usr/share/icons/"

  for i in 16 32 1024; do
    local icons_dir="$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
    install -m 755 -d "$icons_dir"
    install -m 644 "res/Icon-$i.png" "$icons_dir/sviewgl.png"
  done
}

# vim:set ts=2 sw=2 et:
