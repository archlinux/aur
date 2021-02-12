# Maintainer: Rafał Kozdrój <kozeid2+aur@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgname=sdl
pkgname=$_pkgname-git
pkgver=1.2.15.r336.08d4c52c
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard"
arch=('x86_64')
url="https://www.libsdl.org"
license=('LGPL')
depends=('glibc' 'libxext' 'libxrender' 'libx11')
makedepends=('alsa-lib' 'mesa' 'libpulse' 'glu' 'git')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('staticlibs')
source=("git+https://github.com/libsdl-org/SDL-1.2.git")
md5sums=('SKIP')

pkgver() {
  cd "SDL-1.2"
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "SDL-1.2"
  ./autogen.sh
  ./configure --prefix=/usr --disable-nasm --enable-alsa \
              --with-x --disable-rpath --disable-static
  make
}

package() {
  cd "SDL-1.2"
  make DESTDIR="$pkgdir/" install
}
