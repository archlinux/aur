# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: apaugh
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=fife
pkgver=0.3.5
pkgrel=3
pkgdesc="Flexible Isometric Free Engine is a cross platform game creation framework"
arch=(i686 x86_64)
url="http://fifengine.net/"
license=('LGPL')
depends=('boost-libs' 'guichan' 'libgl' 'libvorbis' 'libxcursor' 'tinyxml'
         'openal' 'python2' 'sdl_image' 'sdl_ttf')
makedepends=('scons' 'boost' 'mesa' 'swig' 'zlib')
source=("http://downloads.sourceforge.net/project/$pkgname/active/src/${pkgname}_$pkgver.tar.gz" "0001-Use-proper-bools-necessary-to-work-with-fifechan-HEA.patch::https://github.com/fifengine/fifengine/commit/b87d8f9ff9e3ce1a3b6de513a71f8fe52e0fded2.patch")
md5sums=('11ba50b34239535a270d442466632ef7'
         '58496b4205c1574c586fc0fce8736bad')
sha256sums=('1d3c7a19d05ae426af6ccd50a8ba79a71eb6e6f18f0226d1abdaeae7fcf9d3a8'
            'c7b7cd96a0115ba196b5c38268bb49ec48b40d90f5f5dd3378b3ef9f3d8f40a6')

prepare() {
  cd "${pkgname}_$pkgver"

  # use python2
  export PYTHON=python2

  # strip ldconfig
  sed -i "/LD_RUN_PATH/d" build/linux2-config.py
}

build() {
  cd "${pkgname}_$pkgver"
  scons --prefix=/usr fife
}

prepare() {
  cd "${pkgname}_$pkgver"
  patch -p1 < "$srcdir/0001-Use-proper-bools-necessary-to-work-with-fifechan-HEA.patch"
}

package() {
  cd "${pkgname}_$pkgver"
  scons --prefix=/usr DESTDIR="$pkgdir/" install-all
}

# vim:set ts=2 sw=2 et:
