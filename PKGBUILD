# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Johnathan Jenkins <twodopeshaggy@gmail.com>

pkgname=aview
pkgver=1.3.0_rc1
pkgrel=4
pkgdesc="a high quality ascii-art image browser"
arch=('x86_64')
url="https://aa-project.sourceforge.net/aview/"
license=('GPL-2.0-only')
depends=('aalib' 'bash' 'glibc')
optdepends=('netpbm: image format conversion for asciiview'
            'imagemagick: image format conversion for asciiview')
source=("https://downloads.sourceforge.net/sourceforge/aa-project/aview-${pkgver/_/}.tar.gz")
sha256sums=('42d61c4194e8b9b69a881fdde698c83cb27d7eda59e08b300e73aaa34474ec99')

build() {
  cd "$srcdir/$pkgname-1.3.0"
  # the bundled autoconf 2.13 configure script and sources use pre-C99 constructs
  export CFLAGS+=" -std=gnu89"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-1.3.0"
  make prefix="$pkgdir/usr" mandir="$pkgdir/usr/share/man" install
}
