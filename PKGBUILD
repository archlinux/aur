# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: apaugh
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=fife
pkgver=0.4.2
pkgrel=1
_githubname=fifengine
pkgdesc="Flexible Isometric Free Engine is a cross platform game creation framework"
arch=('i686' 'x86_64')
url="http://fifengine.net/"
license=('LGPL')
depends=('boost' 'fifechan' 'libvorbis' 'sdl2_ttf' 'openal' 'python' 'tinyxml' 'glew')
makedepends=('cmake' 'mesa' 'swig')
source=("https://github.com/$_githubname/$_githubname/archive/$pkgver.tar.gz")
sha512sums=('2b92e936d3f900532c5dee235a217c338941c44da479dceb3e48b3e8b93a402b31dc5501a6533391a01af53d6dbd51b6793c74e8ac81301ae6f1fa18271761a4')

build() {
  cd "$_githubname-$pkgver"
  [[ -d "build" ]] && rm -r "build"
  mkdir -p "build" && cd "build"
  cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    ..
  make
  # If compilation seems to stall at 99% for ages, do not abort!
  # While not perfectly convenient, that is to be expected from
  # SWIG. Eventually, you'll reach the holy triple-digit land.
}

package() {
  cd "$_githubname-$pkgver"
  cd "build"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
