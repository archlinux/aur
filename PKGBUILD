# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=pianobar-git
_gitname=pianobar
pkgver=711.b534a3b
pkgrel=1
pkgdesc="A free/open-source, console-based replacement for Pandora's Flash player"
url="http://6xq.net/projects/pianobar/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libao' 'ffmpeg' 'readline' 'json-c' 'libgcrypt' 'gnutls')
optdepends=('libmad')
makedepends=('pkgconfig>=0.9' 'git' 'automake')
provides=('pianobar')
conflicts=('pianobar')
source=('git+https://github.com/PromyLOPh/pianobar.git')
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd $srcdir/$_gitname
  sed -i 's/^#LIBAV:=ffmpeg2.2/LIBAV:=ffmpeg2.2/' Makefile
}

build() {
  cd $srcdir/$_gitname
  make
}

package() {
  cd $srcdir/$_gitname
  make DESTDIR=$pkgdir PREFIX=/usr install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
