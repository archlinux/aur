# Maintainer: Peter Lamby <peterlamby@web.de>
pkgname=deadbeef-opus-git
_gitname=deadbeef-opus
pkgver=80.330e3a3
pkgrel=1
pkgdesc="opus plugin for the DeaDBeeF music player"
arch=('i686' 'x86_64')
url="https://bitbucket.org/Lithopsian/deadbeef-opus"
license=('GPL2')
provides=(deadbeef-opus)
conflicts=(deadbeef-opus)
depends=('deadbeef' 'opusfile')
source=('git+https://bitbucket.org/Lithopsian/deadbeef-opus.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}


build() {
  cd "${srcdir}/$_gitname"
  sed -i '1s/^/#define DDB_DECODER_HINT_NEED_BITRATE 0x2\n/' opus.c
  make
}

package() {
  cd "${srcdir}/$_gitname"

  install -Dm 755 opus.so "$pkgdir/usr/lib/deadbeef/opus.so"
}
