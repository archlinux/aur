# Contributor: Evgeny Grablyk <evgeny.grablyk@gmail.com>
pkgname=vfu-utf
pkgver=4.15
pkgrel=1
pkgdesc="VFU is console (text mode) file manager. Patched for Unicode (UTF-8) support."
arch=('i686' 'x86_64')
url="http://cade.datamax.bg/vfu/"
license=('GPL')
depends=('ncurses' 'pcre')
optdepends=('perl: for the rx_* archiving utilities'
            'rpmextract: for rx_rpm'
            'unrar: for rx_rar'
            'unzip: for rx_zip')
replaces=('vfu')
backup=('etc/vfu/vfu.conf')
install='vfu.install'
source=(http://cade.datamax.bg/vfu/vfu-$pkgver.tar.gz \
	vfu-$pkgver-unicode.patch)
md5sums=('3faf23c14703d50d633ecc5b9f39dcc7'
         '218b3674f660dc9c41dafdbb4a5ad44d')

build() {
  cd "$srcdir/vfu-$pkgver"

  # patch for unicode (utf-8) support.
  patch -p1 -i ../vfu-$pkgver-unicode.patch

  make CCDEF="$CFLAGS -D_FILE_OFFSET_BITS=64"
  ./build.docs
}

package() {
  cd "$srcdir/vfu-$pkgver"
  install -Dm755 vfu/vfu "$pkgdir/usr/bin/vfu"
  install -Dm644 vfu.1 "$pkgdir/usr/share/man/man1/vfu.1"
  install -Dm644 vfu.conf "$pkgdir/etc/vfu/vfu.conf"
  install rx/rx_* "$pkgdir/usr/bin/"
}

