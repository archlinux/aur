# Maintainer: RP <reyadmin AT gmail DOT com>
pkgname=hxtools
pkgver=20201116
pkgrel=1
pkgdesc="A collection of tools and scripts that have accumulated over the years, and each of which seems to be too small to warrants its own project."
arch=('i686' 'x86_64')
url=http://inai.de/projects/hxtools/
license=('GPL3')
depends=('libhx>=3.19' perl util-linux pciutils libxcb)
makedepends=()
source=(http://inai.de/files/hxtools/hxtools-$pkgver.tar.xz
        Rename_rot13_to_trrot13.patch)
sha256sums=('c4bf0de4b39892eacb74a148d2587f0611f0abd2a2c4919a0e8e6639a74b7c69'
            '89f65c581179582f178c1d60dbe9a702d7efb5b07f35442f03c9463af0c5b04d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  ## uncomment the following lines to avoid nameclash with same named binary in bsd-games package
#  mv doc/rot13.1 doc/trrot13.1
#  mv suser/rot13 suser/trrot13
#  patch -Np1 < "$srcdir/Rename_rot13_to_trrot13.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --libexecdir=/usr/lib --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}
