# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=partialZipBrowser
pkgname=${_name,,}
pkgver=48
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
sha256sums=('d0156d4ee7136c3f6d8bc78d56719c26a474221b7d83fe7d14b04ac40634d9a2')

build() {
  cd "$_name"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$_name"

  make DESTDIR="$pkgdir/" install
}
