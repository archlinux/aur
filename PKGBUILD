# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
pkgname=deadbeef-lyrics-hg
_hgname=deadbeef-lyrics
pkgver=36
pkgrel=1
pkgdesc="Lyrics plugin for the DeaDBeeF music player"
arch=('i686' 'x86_64')
url="https://bitbucket.org/trollixx/deadbeef-lyrics"
license=('GPL2')
depends=('deadbeef')
source=('hg+https://bitbucket.org/trollixx/deadbeef-lyrics' 'buildfix.diff')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd $srcdir/$_hgname
  hg id -n
}

prepare() {
        cd "$srcdir/$_hgname"
        patch -p1 < ../buildfix.diff
}

build() {
  cd "${srcdir}/$_hgname"
  make
}

package() {
  cd "${srcdir}/$_hgname"

  install -Dm 755 ddb_lyrics.so "$pkgdir/usr/lib/deadbeef/ddb_lyrics.so"
}
