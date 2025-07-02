# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=vorbis-tools-git
pkgver=1.4.3.r12.gcfc497a
pkgrel=1
pkgdesc="Command-line tools for creating and playing Ogg Vorbis files"
arch=('i686' 'x86_64')
url="https://xiph.org/vorbis/"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'libao.so' 'libcurl.so' 'libFLAC.so' 'libvorbis.so' 'libvorbisenc.so' 'libvorbisfile.so')
makedepends=('git' 'curl' 'flac' 'libao' 'libvorbis')
provides=("vorbis-tools=$pkgver")
conflicts=('vorbis-tools')
source=("git+https://gitlab.xiph.org/xiph/vorbis-tools.git")
sha256sums=('SKIP')


pkgver() {
  cd "vorbis-tools"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "vorbis-tools"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "vorbis-tools"

  make DESTDIR="$pkgdir" install
}
