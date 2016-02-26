# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=boblight
_svnrev=479
pkgver=r479
pkgrel=2
pkgdesc="Collection of tools for driving lights connected to an external controller"
url="http://code.google.com/p/boblight/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('libusbx' 'libxext' 'libxrender' 'mesa' 'portaudio')
makedepends=('glu' 'subversion')
source=("svn+https://boblight.googlecode.com/svn/trunk#revision=$_svnrev"
        "$pkgname.service")
md5sums=('SKIP'
         '465a99144ad2e86a20d3433b426320b2')

pkgver() {
  cd "$srcdir/trunk"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/trunk"

  ./configure --prefix=/usr \
              --disable-static
  make
}

package() {
  cd "$srcdir/trunk"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
