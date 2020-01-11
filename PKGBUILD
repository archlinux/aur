# Contributor: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>

pkgname=kcgi
pkgver=0.10.11
pkgrel=1
pkgdesc="Minimal CGI and FastCGI library"
arch=('i686' 'x86_64')
url="http://kristaps.bsd.lv/kcgi/"
license=('custom')
depends=('glibc' 'libbsd')
makedepends=('bmake')
source=("https://kristaps.bsd.lv/kcgi/snapshots/$pkgname-$pkgver.tgz"
        "LICENSE")
sha512sums=('d95c196a8586da65c15a58d58b27f53219921c7ed98cfad273e67c0f364ab7beb4986ecddeb55a155645b8fef53087d418d6a32a524b6fa900f93555cb4e460f'
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

