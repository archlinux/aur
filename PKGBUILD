#Maintainer: Okabe Zero-Link (okbzl). Email: okabezerolink@gmail.com

_pkgname=xsystem4
pkgname=${_pkgname}-git
pkgver=1.0.0.r0.gd3cb6b4
pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="This is a cross-platform implementation of AliceSoft's System 4 engine"
arch=(x86_64)
url="https://github.com/nunuhara/xsystem4"
license=('GPL-2.0-only')
depends=(chibi-scheme ffmpeg freetype2 libffi libpng libsndfile libjpeg-turbo libwebp sdl2 zlib)
makedepends=(bison flex glew meson)
conflicts=(${_pkgname})
prepare () {
	git clone --recursive $url
}

build() {
	cd "$srcdir/${_pkgname}"
	mkdir build
	meson setup build --prefix /usr
	ninja -C build
}

package() {
  cd "$srcdir/${_pkgname}"
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
