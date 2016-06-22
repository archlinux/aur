# Maintainer: JKA Network <contacto@jkanetwork.com>
# Before maintainer: Todor Imreorov for github <blurymind@gmail.com>
pkgname=gdevelop-git
pkgver=20160622
pkgrel=1
pkgdesc="A full featured, open source game development software, allowing to create HTML5 and native games without knowing a programming language. All the game logic is made thanks to an intuitive and powerful event based system."
arch=('x86_64')
url=http://www.compilgames.net
license=('GPL' 'MIT' 'zlib/png')
groups=()
provides=('gdevelop')
install='gdevelop-git.install'
makedepends=('rsync' 'cmake' 'git' 'curl')
depends=('gcc' 'wxgtk' 'openal' 'p7zip' 'glew' 'libsndfile' 'systemd' 'libjpeg-turbo' 'desktop-file-utils' 'gtk-update-icon-cache')
source=('git+https://github.com/4ian/GD.git')
md5sums=(SKIP)
build() {
  cd "$srcdir"/GD
  cd Binaries
  rm -rf build
  mkdir build
  cd build
  cmake ../..
  #Build the whole project
  make -j4
}
package() {
  cd "$srcdir"/GD
  cd Binaries/build
  make install DESTDIR="$pkgdir"
  #Remove sfml installed libs
  rm -rf "$pkgdir"/usr/local
}
