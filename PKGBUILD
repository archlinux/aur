# Maintainer: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>
pkgname=kcgi
pkgver=0.8.4
pkgrel=1
pkgdesc="Minimal CGI and FastCGI library"
arch=('i686' 'x86_64')
url="http://kristaps.bsd.lv/kcgi/"
license=('custom')
depends=('glibc')
source=("https://kristaps.bsd.lv/kcgi/snapshots/$pkgname-$pkgver.tgz"
        "LICENSE")
sha512sums=('e57e7af9a3fbf0be38e962fb6fba3b42bf7e92689dea2360435774c1e1cad91e871a75dfd3036845d9fad6757acc038c28ede50da3518de6e2872f022b1fbafa'
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

