# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=taskopen
pkgver=2.0.1
pkgrel=1
pkgdesc="Script for taking notes and open urls with taskwarrior"
arch=('i686' 'x86_64')
url="http://github.com/jschlatow/taskopen/"
license=('GPL')
depends=('task>=2.5.0')
optdepends=('xdg-utils: easily use default application associated with a file type')
makedepends=('make' 'nim')
source=("https://codeload.github.com/jschlatow/taskopen/tar.gz/v${pkgver}")
sha256sums=("d6749ff4933393d2b4f7e9e222c19ba3cea546e4e74bdc96c7e4a31a76fd7861")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make VERSION=${pkgver} PREFIX="/usr" || return 1
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make VERSION=${pkgver} DESTDIR="$pkgdir" PREFIX="/usr" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
