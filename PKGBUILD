# Maintainer: Jon Bergli Heier <snakebite@jvnv.net>
pkgname=rlvm
pkgver=0.14
pkgrel=2
pkgdesc="RealLive clone for Linux and OSX"
arch=(i686 x86_64)
url="http://www.elliotglaysher.org/rlvm/"
license=('GPL')
depends=('boost-libs>=1.46' glew libmad sdl_mixer sdl_image sdl_ttf)
makedepends=(scons boost)
source=(https://github.com/eglaysher/rlvm/archive/release-${pkgver}.tar.gz luabind.patch)
md5sums=('03a7df65cf22bba83547d412fd07e941'
         'ed77bb39c013519544f16a4db7c17f3a')

build() {
  cd "$srcdir/rlvm-release-${pkgver}"
  patch -p1 < "$srcdir/luabind.patch"

  scons --release

}

package() {
  cd "$srcdir/rlvm-release-${pkgver}"

  install -D "$srcdir/rlvm-release-${pkgver}/build/release/rlvm" "$pkgdir/usr/bin/rlvm"
  install -D "$srcdir/rlvm-release-${pkgver}/src/platforms/gtk/rlvm.desktop" "$pkgdir/usr/share/applications/rlvm.desktop"
  for r in 16 24 32 48 128 256; do
    install -d "$pkgdir/usr/share/icons/hicolor/${r}x$r"
    install -D "$srcdir/rlvm-release-${pkgver}/resources/$r/rlvm.png" "$pkgdir/usr/share/icons/hicolor/${r}x$r/apps/rlvm.png"
  done
}

# vim:set ts=2 sw=2 et:
