# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=partialZipBrowser
pkgname=${_name,,}
pkgver=44
pkgrel=1
pkgdesc='Commandline tool for browsing and downloading files from zip files on remote webserver'
arch=('x86_64')
url="https://github.com/tihmstar/$_name"
license=('LGPL-3.0-only')
# libfragmentzip's .pc file causes this to link to its dependencies (curl and zlib)
# depend on curl since it's actually needed but skip zlib
depends=('curl' 'libfragmentzip')
makedepends=('git')
source=("git+$url.git#tag=$pkgver")
sha256sums=('8564fdcf22c9c3af23e7df086a0289eed4fbbc20ea84e0abd90fe9d94b90a27a')

build() {
  cd "$_name"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$_name"

  make DESTDIR="$pkgdir/" install
}
