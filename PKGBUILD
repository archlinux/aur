# Maintainer: Lettier <gifcurry_aur a@@at@t lettier dd.ot..t ccommm>

_hkgname=Gifcurry
_ver=2.3.0.0
_xrev=0

pkgname=gifcurry
pkgver=${_ver}_${_xrev}
pkgrel=1
pkgdesc="Open source video to GIF maker that allows overlaid text."
url="https://github.com/lettier/gifcurry"
license=("BSD3")
arch=("i686" "x86_64")
makedepends=("make" "gobject-introspection" "git" "gmp" "zlib")
depends=("gtk3" "ffmpeg" "imagemagick")
options=("strip" "staticlibs")
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${_ver}/${_hkgname}-${_ver}.tar.gz")
sha256sums=('906119e22e7a358ddd48fe7350757502bce9b274e24ed46bacb59e8e4c9e95f7')

build() {
  cd "${srcdir}"
  if [ ! `command -v stack` ]; then
    git clone https://aur.archlinux.org/stack-bin.git
    cd "stack-bin"
    makepkg -sic
  fi
  cd "${srcdir}/${_hkgname}-${_ver}"
  make PREFIX="/usr" arch_os_build_gifcurry
}

package() {
  cd "${srcdir}/${_hkgname}-${_ver}"
  make PREFIX="/usr" DESTDIR="$pkgdir" arch_os_install_gifcurry
}
