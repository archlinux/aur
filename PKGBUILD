# Maintainer: fzerorubigd <fzero@rubi.gd>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgbase='openage'
pkgname="$_pkgbase-git"
pkgver=v0.3.0.r160.g6b8ff36
pkgrel=1
pkgdesc='A free (as in freedom) clone of the Age of Empires II engine'
arch=('i686' 'x86_64')
url='http://openage.sft.mx/'
license=('GPL3')
depends=('python' 'libgl' 'libepoxy' 'ftgl' 'fontconfig' 'sdl2' 'sdl2_image' 'opusfile')
makedepends=('git' 'cmake' 'python-pillow' 'gcc' 'cython' 'python-pygments')
optdepends=('python-pillow: for the media convert script'
            'python-numpy: for the media convert script'
            'opus-tools: for the media convert script'
            'ttf-dejavu: for text display, but you can use any font')
provides=('openage')
conflicts=('openage')

source=("$_pkgbase::git+https://github.com/SFTtech/openage")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgbase"
  mkdir -p build
}

build() {
  cd "$srcdir/$_pkgbase/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/$_pkgbase/build"
  make DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/usr/bin
  cp "$srcdir/$_pkgbase/run" $pkgdir/usr/bin/openage
}

# vim:set ts=2 sts=2 sw=2 et:
