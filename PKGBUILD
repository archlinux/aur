# Maintainer: Peter <craven@gmx.net>
# Contributor: Jonathon Fernyhough <>

pkgname=chez-scheme-git
_pkgname=ChezScheme
pkgver=9.5.r11.g1febe9b
pkgrel=1
pkgdesc="Chez Scheme is an implementation of the Revised6 Report on Scheme (R6RS) with numerous language and programming environment extensions. (threaded build)"
arch=(i686 x86_64)
url="https://github.com/cisco/ChezScheme"
license=('APL')
makedepends=('git' 'ncurses' 'libx11' 'xproto')
provides=(chez-scheme)
conflicts=(petite-chez-scheme)
replaces=(petite-chez-scheme)
source=('git+https://github.com/cisco/ChezScheme.git'
        'git+https://github.com/nanopass/nanopass-framework-scheme.git'
        'git+https://github.com/dybvig/stex.git'
        'git+https://github.com/madler/zlib.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  rmdir nanopass stex zlib
  ln -s ../nanopass-framework-scheme nanopass
  ln -s ../stex
  ln -s ../zlib
}

build() {
  cd "$_pkgname"
  ./configure --installprefix=/usr --temproot="$pkgdir" --threads
  make
}

package() {
  make -C "$_pkgname" DESTDIR="$pkgdir"/ install InstallSchemeName=chez-scheme
}

# vim:set ts=2 sw=2 et:
