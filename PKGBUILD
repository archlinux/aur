# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Maks Verver <maksverver@geocities.com>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
# Contributor: nokangaroo <nokangaroo@aon.at>

pkgname=golly
pkgver=2.8
pkgrel=3
pkgdesc="A simulator for Conway's Game of Life and other cellular automata"
arch=('i686' 'x86_64')
url="http://golly.sourceforge.net/"
license=('GPL')
depends=('wxgtk')
makedepends=('gendesk' 'perl' 'python2')
optdepends=('perl: for Perl scripting support'
            'python2: for Python scripting support')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-src.tar.gz"
        "golly.desktop")
sha256sums=('0488724715bae228e88d0a819d8ed311f964c70f37f228f6218bc053a1b09b28'
            '3bc28f142f9f7abb47ce06a1194aecf91ee1286e442f1b59e03fbfd9fcaecea4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"

  gui-wx/configure/configure \
    LIBS='-ldl -lGL' \
    --enable-perl \
    --with-perl-shlib=/usr/lib/perl5/core_perl/CORE/libperl.so \
    --with-python-shlib=libpython2.7.so \
    --with-wx-config=/usr/bin/wx-config \
    --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"

  make DESTDIR="$pkgdir" install

  install -D -m644 "${srcdir}/${pkgname}.desktop" \
    "$pkgdir"/usr/share/applications/"${pkgname}.desktop"
  install -D -m644 gui-wx/icons/appicon.xpm \
    "$pkgdir"/usr/share/pixmaps/"${pkgname}.xpm"
}
