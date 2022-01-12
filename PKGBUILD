# Maintainer: Andy Alt <andy400-dev at yahoo dot com>
# Contributor: Evgeny Grablyk <evgeny.grablyk@gmail.com>

pkgname=vfu
pkgver=4.22
pkgrel=1
pkgdesc="Versatile text-based file-manager"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'ppc64le')
url="http://cade.noxrun.com/projects/vfu"
license=('GPL')
depends=('ncurses')
optdepends=('perl: for the rx_* archiving utilities'
            'rpmextract: for rx_rpm'
            'unrar: for rx_rar'
            'unzip: for rx_zip')
backup=('etc/vfu.conf' 'etc/vfu/vfu.conf')
source=("http://cade.noxrun.com/projects/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('39d726cc4c24945c85cd76842053f01bdf686728dad2add6ca2f0157fa409223')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make CCDEF="$CFLAGS -D_FILE_OFFSET_BITS=64"
  ./build.docs
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 vfu/vfu -t "$pkgdir/usr/bin"
  gzip vfu.1
  install -Dm644 vfu.1.gz -t "$pkgdir/usr/share/man/man1"
  install -Dm644 vfu.conf -t "$pkgdir/etc"
  install rx/rx_* "$pkgdir/usr/bin/"
}

