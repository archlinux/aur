# Maintainer: JKA Network <contacto@jkanetwork.com>
# Before maintainer: Todor Imreorov for github <blurymind@gmail.com>
pkgname=gdevelop
pkgver=4.0.96
pkgrel=1
pkgdesc="A full featured, open source game development software, allowing to create HTML5 and native games without knowing a programming language. All the game logic is made thanks to an intuitive and powerful event based system."
arch=('x86_64')
url=http://www.compilgames.net
license=('GPL' 'MIT' 'zlib/png')
groups=()
provides=('gdevelop')
install='gdevelop.install'
makedepends=('rsync' 'cmake' 'git' 'curl')
depends=('gcc' 'wxgtk' 'openal' 'p7zip' 'glew' 'libsndfile' 'systemd' 'libjpeg-turbo' 'desktop-file-utils' 'gtk-update-icon-cache')
source=("https://github.com/4ian/GD/archive/$pkgver.tar.gz")
sha256sums=('bff5b2a796791b3ae1612c757c89479652af18c70731106ea6b69ae89291fd00')
build() {
  cd "$srcdir"/GD-$pkgver
  cd Binaries
  rm -rf build
  mkdir build
  cd build
  cmake ../..
  #Build the whole project
  make -j4
}
package() {
  cd "$srcdir"/GD-$pkgver
  cd Binaries/build
  make install DESTDIR="$pkgdir"
  #Remove sfml installed libs
  rm -rf "$pkgdir"/usr/local
}
