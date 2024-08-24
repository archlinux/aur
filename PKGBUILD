# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=partialZipBrowser
_pkgname=${_name,,}
pkgname=$_pkgname-git
pkgver=44.r0.g1a4bf6a
pkgrel=2
pkgdesc='Commandline tool for browsing and downloading files from zip files on remote webserver - git version'
arch=('x86_64')
url="https://github.com/tihmstar/$_name"
license=('LGPL-3.0-only')
# libfragmentzip's .pc file causes this to link to its dependencies (curl and zlib)
# depend on curl since it's actually needed but skip zlib
depends=('curl' 'libfragmentzip')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"

  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_name"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$_name"

  make DESTDIR="$pkgdir/" install
}
