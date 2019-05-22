# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: apaugh
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=fife
pkgver=0.4.2
pkgrel=2
_githubname=fifengine
pkgdesc="Flexible Isometric Free Engine is a cross platform game creation framework"
arch=('i686' 'x86_64')
url="http://fifengine.net/"
license=('LGPL')
depends=('boost' 'fifechan' 'libvorbis' 'sdl2_ttf' 'openal' 'python' 'tinyxml' 'glew')
makedepends=('cmake' 'mesa' 'swig')
# source=("https://github.com/$_githubname/$_githubname/archive/$pkgver.tar.gz")
# Needs to build at this commit to be able to build with swig 4, upstream doesn't want to tag:
source=("$pkgver-d14f232.tar.gz::https://github.com/$_githubname/$_githubname/archive/d14f232f4cd9a00b05d6872957070e8c020f515d.tar.gz")
sha512sums=('6fafca8e75b7f8a374b74c9e75cfa63208277f976ef9efcdb1da5c94a1ef46dacd320afe0b9dbd83a1ce8acb078a28d687328b3c4ba8227510f492e5a8df9373')

build() {
  # cd "$_githubname-$pkgver"
  cd "$_githubname-d14f232f4cd9a00b05d6872957070e8c020f515d"
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
  # cd "$_githubname-$pkgver"
  cd "$_githubname-d14f232f4cd9a00b05d6872957070e8c020f515d"
  cd "build"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
