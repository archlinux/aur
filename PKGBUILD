# Contributor: Jaroslaw Rosiek <philosoph@interia.pl>
pkgname=cc65
pkgver=2.13.3
pkgrel=4
pkgdesc="C compiler for 6502 family microprocessors"
makedepends=('linuxdoc-tools')
arch=('i686' 'x86_64')
license=('custom')
url="http://www.cc65.org/"
source=("ftp://ftp.musoftware.de/pub/uz/cc65/cc65-sources-$pkgver.tar.bz2"
        "cc65.sh"
        "patch-$pkgver.diff"
        "license")
sha512sums=('135004bdd50abc749409f4a3efbc5c93a09e940d787b6a2034df4de8459e78fa5f813e2e0673cdf9f8bf50c6df8b1313b36ff395d6e82560d0e669da03130776'
            'b6304fd3c14955ee14eb1d041f78c933fbd07760cf560f1c9018c0020c466fb754660404d3c59e903668a07c38001eac273a15a883f1fc0eec126cc9b40733b0'
            'ac1cfcf0c42107cc0c380b88d9a17c1d46b5a69a6073487129ff269760c38f5b83587713396181785a7eacc2f0de4d4f5ff4d106206a0ae1c53731f831888e3a'
            '83ae977985a5ed5f0f5eab67ffbc6195cba73e7458507385eb8d18294eb02d97edc56585a79d496f5abe349423d37790fdb695d0b27178bedb4a5efd5e17b130')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/patch-$pkgver.diff"
}

build() {
  cd "$srcdir/cc65-$pkgver"
  make -j1 -f make/gcc.mak
}

package() {
  cd "$srcdir/cc65-$pkgver"
  make -j1 -f make/gcc.mak DEST_DIR="$pkgdir/" install
  install -Dm644 "$srcdir/cc65.sh" "$pkgdir/etc/profile.d/cc65.sh"
  install -Dm644 "$srcdir/license" "$pkgdir/usr/share/licenses/$pkgname/license"
}
