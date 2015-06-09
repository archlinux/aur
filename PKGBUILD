# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Aurélien Chabot <contact@aurelienchabot.fr>
# Contributor: Étienne Deparis <etienne@depar.is>

pkgname=cv
pkgdesc="Shows running coreutils basic commands and displays stats"
pkgver=0.6
pkgrel=1
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('gcc' 'make')
url="https://github.com/Xfennec/cv"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/Xfennec/$pkgname/tar.gz/v$pkgver)
sha256sums=('4291ab2f0c507df9eb694bf956ed65dc12bae3c492b795235142b5b87e2e2239')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Building...'
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg 'Installing documentation...'
  for _doc in capture.png README.md; do
    install -Dm 644 "$_doc" "$pkgdir/usr/share/doc/$pkgname/$_doc"
  done

  msg 'Installing...'
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
