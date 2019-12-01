# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=partialZipBrowser
_pkgname=${_name,,}
pkgname=$_pkgname-git
pkgver=1.0.r26.g7c43bde
pkgrel=1
pkgdesc='Commandline tool for browsing and downloading files from zip files on remote webserver - git version'
arch=('x86_64')
url="https://github.com/tihmstar/$_name"
license=('LGPL3')
# libfragmentzip's .pc file causes this to link to its dependencies (curl, libzip and zlib)
# depend on curl since it's actually needed but skip the others
depends=('curl' 'libfragmentzip')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"

  # 's/^v//' removes 'v' prefix
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
