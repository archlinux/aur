# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Xyne <ac xunilhcra enyx, backwards>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: cs-cam - me.at.camdaniel.com
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=asunder-svn
pkgver=r463
pkgrel=1
pkgdesc="a graphical CD ripper and encoder"
arch=(x86_64)
url="http://littlesvr.ca/asunder/"
license=(GPL2)
depends=(gtk2 libcddb cdparanoia)
makedepends=(subversion pkgconfig intltool gettext)
optdepends=(
  'lame: for mp3 support'
  'vorbis-tools: for ogg support'
  'fdkaac: for mp3 support'
  'flac: for flac support'
  'opus-tools: for opus support'
  'wavpack: for wavpack support'
  'musepack-tools: for musepack support'
  'mac: for monkey audio support'
)
provides=(asunder)
conflicts=(asunder)
source=("svn+svn://littlesvr.ca/prog/asunder")
sha512sums=('SKIP')

pkgver() {
  cd asunder
  printf "r%s" "$(svnversion | tr -d 'A-z')"
}

prepare() {
  cd asunder
  ./autogen.sh
}

build() {
  cd asunder
  ./configure --prefix=/usr
  make
}

package() {
  cd asunder
  make DESTDIR="${pkgdir}" install
}
