# Maintainer: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>
pkgname=kcgi
pkgver=0.8.3
pkgrel=1
pkgdesc="Minimal CGI and FastCGI library"
arch=('i686' 'x86_64')
url="http://kristaps.bsd.lv/kcgi/"
license=('custom')
depends=('glibc')
source=("https://kristaps.bsd.lv/kcgi/snapshots/$pkgname-$pkgver.tgz"
        "LICENSE")
sha512sums=('e0e01ca94008970a9e15048fd2b0d3ea8dfb0e1bb7551cab5f1d14a859df12261d9c72ad18b53e16b2023be497ca9ba7d2181f64d9a5efae4bbd1ea4dc3494bb'
            'b040c157fe8b95a41a0375d2cd3cc4e6406a988ed5f337b0c6dd15f1ea08344196018a5c2353c2acfbde7858ca5e0f2bf00d1cc4890661effadf39e239a95520')

build() {
  cd $pkgname-$pkgver

  ./configure
  make
}

check() {
  cd $pkgname-$pkgver

  make regress
}

package() {
  cd $pkgname-$pkgver

  make PREFIX="$pkgdir/usr" SBINDIR="$pkgdir/usr/bin" install

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

