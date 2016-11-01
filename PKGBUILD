# Maintainer: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>
pkgname=kcgi
pkgver=0.9.1
pkgrel=1
pkgdesc="Minimal CGI and FastCGI library"
arch=('i686' 'x86_64')
url="http://kristaps.bsd.lv/kcgi/"
license=('custom')
depends=('glibc')
source=("https://kristaps.bsd.lv/kcgi/snapshots/$pkgname-$pkgver.tgz"
        "fix-kutil_openlog.patch"
        "LICENSE")
sha512sums=('4d6f823fa4cbe47f9806ea70978e23cef6155c7f961ea9968083d6a021dc31b2386a23e9681cf60947f2caf1f9300e9f0c4ad1baf032f9080140d21d67ac2fe0'
            'c4bc67df753211e0f7c7e0296dfafafa011a50e08125e779ef88bcd8517e07406d78de9bf260fa503576eeae0e98e4648b475a4a8e9a80737f5ac059d42096f5'
            'b040c157fe8b95a41a0375d2cd3cc4e6406a988ed5f337b0c6dd15f1ea08344196018a5c2353c2acfbde7858ca5e0f2bf00d1cc4890661effadf39e239a95520')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i "${srcdir}/fix-kutil_openlog.patch"
}

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

