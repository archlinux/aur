# Maintainer: rafaelff <rafaelff@gnome.org>
# Co-maintainer: Quintus <quintus@quintilianus.eu>

pkgname=tsc
pkgver=2.0.0
pkgrel=4
pkgdesc="Jump'n'run game with editor and scripting facilities, fork of SMC"
arch=('x86_64')
url='https://secretchronicles.org/en/'
license=('GPL3')
depends=('sdl_image' 'sdl_ttf' 'sdl_mixer' 'devil' 'boost-libs' 'libxml++2.6'
         'glew' 'pcre' 'gtk-update-icon-cache' 'desktop-file-utils'
         'cegui-0.7')
makedepends=('cmake' 'ruby-rake' 'gperf' 'boost')
source=("https://ftp.secretchronicles.org/releases/TSC-$pkgver.tar.xz"
        'tsc-2.0.0-mga-mandir.patch'
        'tsc-2.0.0-issue457-utf8-rakefile.patch'
        'tsc-2.0.0-mga-rename-custom-filesystem-relative.patch')
sha256sums=('c8a9ca3975f9de16aa59fab2a7864c3c541963b46c2c40533632c4fc621b407a'
            '92603155c1b8f65878361fe31390fa3c79eacbe8559670a9a0476ed654eaa387'
            'd68a995b8ea8b46228fe70feec2e999d26ada568d4d30faece8d3833cf5a4156'
            '70cabaaaf8088473f8e1dafc9ea287e839ce780e99f9d2178122863657cbb207')

prepare() {
    # credits: http://svnweb.mageia.org/packages/cauldron/tsc/current/SOURCES/
  patch -p0 -i tsc-2.0.0-mga-mandir.patch
  patch -p0 -i tsc-2.0.0-issue457-utf8-rakefile.patch
  patch -p0 -i tsc-2.0.0-mga-rename-custom-filesystem-relative.patch

  [ -d build ] && rm -rf build
  mkdir build
}

build() {
  cd build
  cmake ../TSC-$pkgver/tsc/     \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
