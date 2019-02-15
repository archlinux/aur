# Maintainer: Bogdan Sinitsyn <bogdan.sinitsyn@gmail.com>
pkgname=simple-viewer-gl-git
pkgver=3.05.r3.g4bab22c
pkgrel=1
pkgdesc='Simple and tiny image viewer based on OpenGL'
arch=('i686' 'x86_64')
url='https://bitbucket.org/andreyu/simple-viewer-gl'
license=('GPL2')
depends=(
  glfw
  libjpeg
  libpng
  giflib
  libtiff
  libwebp
  freetype2
  lcms2
  zlib
  libexif
  libxrandr
  libxcursor

# Could be opt out
  imlib2
  openexr
)
makedepends=(
  git
  cmake
)
optdepends=(
  # 'imlib2: Common formats support'
  # 'openexr: OpenEXR support'
)
provides=(${pkgname%-git})
conflicts=(
  ${pkgname%-git}
)
source=("${pkgname%-git}::git+https://bitbucket.org/andreyu/simple-viewer-gl.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/${pkgname%-git}"

  make release
}

package() {
  cd "$srcdir/${pkgname%-git}"

  make DESTDIR="$pkgdir/" PREFIX="/usr/" install
  install -m 755 -d "$pkgdir/usr/share/applications/"
  install -m 644 sviewgl.desktop "$pkgdir/usr/share/applications/"
  install -m 755 -d "$pkgdir/usr/share/icons/"
  install -m 644 res/Icon-1024.png "$pkgdir/usr/share/icons/sviewgl.png"
}

# vim:set ts=2 sw=2 et:
