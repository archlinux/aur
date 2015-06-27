# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
# Contributor: mmm
# Contributor: bslackr <brendan at vastactive dot com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
_pkgname=lightspark
pkgname=$_pkgname-git
pkgver=0.7.2.r118.g2c35822
pkgrel=1
pkgdesc="An open source flash player implementation"
arch=('i686' 'x86_64')
url="http://lightspark.sourceforge.net"
license=('LGPL3')
depends=('gtk2' 'boost-libs' 'glew' 'libsigc++' 'libxml++' 'ffmpeg' 'curl' 'desktop-file-utils')
makedepends=('git' 'cmake' 'nasm' 'llvm' 'boost')
optdepends=('gnash-gtk: Gnash fallback support')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$pkgname.install
source=("$_pkgname::git+https://github.com/lightspark/lightspark.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/^lightspark-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCOMPILE_PLUGIN=1 \
    -DCMAKE_BUILD_TYPE=Release \
    -DGNASH_EXE_PATH=/usr/bin/gtk-gnash \
    -DAUDIO_BACKEND="pulseaudio sdl"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
