# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=nedit
pkgver=5.7
pkgrel=4
epoch=1
pkgdesc="A Unix text editor for programmers and general users"
arch=('x86_64')
url="https://sourceforge.net/projects/nedit/"
license=('GPL')
depends=('openmotif')
options=('!makeflags')
source=(https://sourceforge.net/projects/nedit/files/nedit-source/${pkgname}-${pkgver}-src.tar.gz
        nedit.desktop)
sha1sums=('7cd264860ff75b4c64417aa09ca4ce03e4be2b4e'
          '990c9c5aa90436b41974bf9cd79af479cba78ad0')

prepare() {
  cd ${pkgname}-${pkgver/a/}
  sed -i 's|"/bin/csh"|"/bin/sh"|' source/preferences.c
}

build() {
  cd ${pkgname}-${pkgver/a/}
  make CFLAGS+="${CFLAGS} -DBUILD_UNTESTED_NEDIT" linux docs
}

package() {
  cd ${pkgname}-${pkgver/a/}
  install -Dm755 source/nedit "${pkgdir}/usr/bin/nedit"
  install -Dm755 source/nc "${pkgdir}/usr/bin/nedit-client"
  install -Dm644 doc/nedit.man "${pkgdir}/usr/share/man/man1/nedit.1"
  install -Dm644 doc/nc.man "${pkgdir}/usr/share/man/man1/nedit-client.1"
  install -Dm644 doc/nedit.html "${pkgdir}/usr/share/doc/nedit/nedit.html"
  install -Dm644 ../nedit.desktop "${pkgdir}/usr/share/applications/nedit.desktop"
}
