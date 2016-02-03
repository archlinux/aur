# Maintainer: Michael Straube <m.s.online gmx.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko
pkgver=0.7.14
pkgrel=1
pkgdesc="Free version of the german card game Doppelkopf"
arch=('i686' 'x86_64')
url="http://free-doko.sourceforge.net/en/FreeDoko.html"
license=('GPL')
depends=('gtkmm' 'gnet' 'freealut')
makedepends=('asciidoc' 'texlive-latexextra')
conflicts=('freedoko-bin32')
source=("http://downloads.sourceforge.net/free-doko/FreeDoko_$pkgver.src.zip"
        "freedoko-0.7.14-archlinux.patch")
sha256sums=('a27ab7acabb28aa8d038f0022377ea3e68d52626d454beaf0f65e0b91c777de9'
            '69a2dbc5c58fd7bd36f6f67e2628fe441689f862cdad63d3761c0b112e2c3a8b')

prepare() {
  cd "$srcdir/FreeDoko_$pkgver"
  patch -p0 < "$srcdir/freedoko-0.7.14-archlinux.patch"
}

package() {
  cd "$srcdir/FreeDoko_$pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/FreeDoko_0.7.14/bin/FreeDoko.desktop" \
    "$pkgdir/usr/share/applications/freedoko.desktop"

  rm "$pkgdir"/usr/share/doc/freedoko/de/{Windows,SuSE,Windows.kompilieren}
  rm "$pkgdir/usr/share/doc/freedoko/en/Windows"
}
