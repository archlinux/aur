# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=octaforge-git
pkgver=2638.e6b257a
pkgrel=1
pkgdesc="A 3D Game Engine, with Lua scripting, an easy to use in-game editor and more"
arch=('i686' 'x86_64')
url="http://octaforge.org/"
license=('custom')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'zlib' 'luajit')
makedepends=('git')
options=('!buildflags')
source=('octaforge::git+https://github.com/OctaForge/OF-Engine.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/octaforge"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/octaforge/src"
  make
}

package() {
  cd "$srcdir/octaforge/src"
  make install

  # now we need to manually install the required files
  cd "$srcdir/octaforge"
  install -d -m755 "$pkgdir/opt/octaforge"
  cp -a bin_unix "$pkgdir/opt/octaforge/bin"
  cp -a config "$pkgdir/opt/octaforge"
  cp -a media "$pkgdir/opt/octaforge"
  # licensing stuff
  install -D -m644 COPYING.md "$pkgdir"/usr/share/licenses/$pkgname/COPYING.md
  install -D -m644 CONTRIBUTORS.md "$pkgdir"/usr/share/licenses/$pkgname/CONTRIBUTORS.md
}
