# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: bzt <unmacaque at gmail.com>

pkgname=snes9x-git
_gitname=snes9x
pkgver=1.53.r230.gdfc6227
pkgrel=1
pkgdesc="A GTK+ port of the Snes9x emulator (git version)"
arch=('i686' 'x86_64')
url="http://www.snes9x.com/"
license=('LGPL')
depends=('zlib' 'libpng' 'sdl' 'alsa-lib' 'libglade' 'libxv' 'gcc-libs' 
         'libxext' 'libsm' 'libgl' 'gtk3')
makedepends=('intltool' 'nasm' 'mesa' 'git' 'autogen')
provides=('snes9x' 'snes9x-gtk')
conflicts=('snes9x' 'snes9x-gtk')
install=snes9x-git.install
source=("$pkgname"::'git://github.com/snes9xgit/snes9x.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname/gtk"
  ./autogen.sh
  ./configure --prefix=/usr --with-netplay --with-gtk3
  make
}

package() {
  cd "$srcdir/$pkgname/gtk"
  make DESTDIR="$pkgdir" install
}
