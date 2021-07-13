# Maintainer: Andy Alt <andy400-dev at yahoo dot com>
# Contributor: Evgeny Grablyk <evgeny.grablyk@gmail.com>

pkgname=vfu
pkgver=4.21
pkgrel=1
pkgdesc="Versatile text-based file-manager"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'ppc64le')
url="http://cade.datamax.bg/vfu/"
license=('GPL')
depends=('ncurses' 'pcre')
optdepends=('perl: for the rx_* archiving utilities'
            'rpmextract: for rx_rpm'
            'unrar: for rx_rar'
            'unzip: for rx_zip')
backup=('etc/vfu.conf' 'etc/vfu/vfu.conf')
source=("http://cade.datamax.bg/vfu/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f675abdeb6e1b933db956ef6a78c0a1abd0f87166981158fef3146f17a256c37')

build() {
  cd "$srcdir/vfu-$pkgver"

  make CCDEF="$CFLAGS -D_FILE_OFFSET_BITS=64"
  ./build.docs
}

package() {
  cd "$srcdir/vfu-$pkgver"
  install -Dm755 vfu/vfu -t "$pkgdir/usr/bin"
  install -Dm644 vfu.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 vfu.conf -t "$pkgdir/etc"
  install rx/rx_* "$pkgdir/usr/bin/"
}

