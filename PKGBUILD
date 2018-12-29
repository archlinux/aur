# Maintainer: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>
pkgname=kcgi
pkgver=0.10.10
pkgrel=1
pkgdesc="Minimal CGI and FastCGI library"
arch=('i686' 'x86_64')
url="http://kristaps.bsd.lv/kcgi/"
license=('custom')
depends=('glibc' 'libbsd')
makedepends=('bmake')
source=("https://kristaps.bsd.lv/kcgi/snapshots/$pkgname-$pkgver.tgz"
        "LICENSE")
sha512sums=('7eeb39454b0391214e9c162f8e3a2cb1dc944a8b15fedbb88f083046c41ade99fa84170b3a83ed35c9f216f99287e7388d818bf65ecea1efd611a3ac7fc6a68c'
            'b040c157fe8b95a41a0375d2cd3cc4e6406a988ed5f337b0c6dd15f1ea08344196018a5c2353c2acfbde7858ca5e0f2bf00d1cc4890661effadf39e239a95520')
build() {
  cd $pkgname-$pkgver

  ./configure PREFIX=/usr MANDIR=/usr/share/man SBINDIR=/usr/bin
  bmake
}

check() {
  cd $pkgname-$pkgver

  bmake regress
}

package() {
  cd $pkgname-$pkgver

  bmake DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

