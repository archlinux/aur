# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Aurélien Chabot <contact@aurelienchabot.fr>
# Contributor: Étienne Deparis <etienne@depar.is>

pkgname=progress
pkgdesc="Shows running coreutils basic commands and displays stats"
pkgver=0.8
pkgrel=1
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('gcc' 'make')
url="https://github.com/Xfennec/progress"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/Xfennec/$pkgname/tar.gz/v$pkgver)
sha256sums=('52ad6d805eb9826de297ba495cfde3df1deb6288f97ff67e7f93431efa006d34')
replaces=('cv')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg2 'Installing documentation...'
  for _doc in capture.png README.md; do
    install -Dm 644 "$_doc" "$pkgdir/usr/share/doc/$pkgname/$_doc"
  done

  msg2 'Installing...'
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
