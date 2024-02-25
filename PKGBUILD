# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libwmf-git
pkgver=0.2.13.r4.g1b1c053
pkgrel=1
pkgdesc="A library for reading vector images in Microsoft's native Windows Metafile Format"
arch=('i686' 'x86_64')
url="https://github.com/caolanm/libwmf"
license=('GPL-2.0-or-later')
depends=('glibc' 'expat' 'freetype2' 'gsfonts' 'libjpeg' 'libx11')
makedepends=('git' 'gtk2' 'libxt')
optdepends=('gdk-pixbuf2: for pixbuf loader')
provides=("libwmf=$pkgver")
conflicts=('libwmf')
options=('staticlibs')
source=("git+https://github.com/caolanm/libwmf.git")
sha256sums=('SKIP')


pkgver() {
  cd "libwmf"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libwmf"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libwmf"

  make check
}

package() {
  cd "libwmf"

  make DESTDIR="$pkgdir" install
}
