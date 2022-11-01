# Maintainer: Heinrich Kießling <heinrich@kiess.link>
# Contributer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=grsync-svn
_pkgname=grsync
pkgver=1.3.1
pkgrel=179
pkgdesc="GTK+ GUI for rsync to synchronize folders, files and make backups"
arch=('x86_64')
url="http://www.opbyte.it/grsync/"
license=('GPL')
depends=('gtk3' 'rsync')
makedepends=('intltool' 'svn')
source=(svn+https://svn.code.sf.net/p/grsync/code/trunk/grsync
        grsync.appdata.xml
        use-themed-icon.patch)
sha256sums=('SKIP'
            '5dee994cafbcf8adfda34767cbd60f7eb2039bdeccab2dfd879f045bd11fb9fd'
            '6dd0e9b483db7e9f53d69d33d0b1a4cfc528ffee5eaeb2f9defe2596c570ad2d')

prepare() {
  cd $_pkgname
  
  # Use themed icon
  patch -Np1 -i ../use-themed-icon.patch

  autoreconf -fi
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr --disable-unity
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 ../$_pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$_pkgname.appdata.xml"
}
