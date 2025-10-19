#Maintainer: Okabe Zero-Link (okbzl). Email: okabezerolink@gmail.com

pkgname=xsystem4
pkgver=1.0.0
pkgrel=2
pkgdesc="This is a cross-platform implementation of AliceSoft's System 4 engine"
arch=(x86_64)
url="https://github.com/nunuhara/xsystem4"
license=('GPL-2.0-only')
depends=(chibi-scheme ffmpeg freetype2 libffi libpng libsndfile libjpeg-turbo libwebp sdl2 zlib)
makedepends=(bison flex glew meson)
conflicts=(${pkgname}-git)
source=("${pkgname}::git+https://github.com/nunuhara/xsystem4.git#tag=1.0.0")
sha256sums=('SKIP')
prepare () {
	cd "$srcdir/${pkgname}"
	mkdir build
}

build() {
	cd "$srcdir/${pkgname}"
	meson setup build --prefix /usr
	ninja -C build
}

package() {
  cd "$srcdir/${pkgname}"
  DESTDIR="$pkgdir" ninja -C build install

  echo "#######################################################################"
  echo "Regarding compatibility of xsystem4 to AliceSoft games:"
  echo "This should be compatible with AliceSoft games that's published"
  echo "since DALK Gaiden (2002) to Rance 01 (2013). Any game that's"
  echo "published after this that are either not a translation or a simple"
  echo "rerelease aren't compatible. Please read the game compatibility list"
  echo "for more details"
  echo "https://github.com/nunuhara/xsystem4/blob/master/game_compatibility.md"
  echo "#######################################################################"
}
