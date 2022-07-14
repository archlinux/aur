# Maintainer: Riccardo Sacchetto <rsacchetto@nexxontech.it>
pkgname=trash-d
pkgver=18
pkgrel=1
pkgdesc="A near drop-in replacement for rm that uses the trash bin. Written in D"
arch=('x86_64')
url="https://github.com/rushsteve1/trash-d"
license=('GPL')
makedepends=(dmd dub ruby ruby-rake ruby-ronn-ng)
source=("https://github.com/rushsteve1/trash-d/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('ad6ca117b4b9cff7ef280d407ad3014c9bd0ef2442504e15b9dc1fab95882bea46fabdca2641df831de446a5444708a411aaff7764772fa67789e7da2914b91e')

build() {
  # Enter the trash-d source folder downloaded from GitHub
  cd "$srcdir/$pkgname-$pkgver"

  # Build binary using Ruby Rake
  rake build:release

  # Build the manpage using Ruby Rake and Ronn
  rake manpage
}

check() {
  # Enter the trash-d source folder downloaded from GitHub
  cd "$srcdir/$pkgname-$pkgver"

  # Run the tests provided by the developer
  rake test
}

package() {
  # Enter the trash-d source folder downloaded from GitHub
  cd "$srcdir/$pkgname-$pkgver/build"

  # Install the produced binary
  install -Dm755 "./trash" "${pkgdir}/usr/bin/trash"

  # Install the manpage in the section #1
  install -Dm644 "./trash.man" "${pkgdir}/usr/share/man/man1/trash.1"
}
