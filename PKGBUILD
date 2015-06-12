# Maintainer: Jaume <jaume@delclos.com>
pkgname=rgbds-git
pkgver=v0.0.2.r25.g3ecd169
pkgrel=1
pkgdesc="Rednex GameBoy Development System"
arch=('i686' 'x86_64')
url="https://github.com/bentley/rgbds/"
license=('custom')
depends=('glibc')
makedepends=('git' 'gcc' 'bison')
source=("$pkgname::git+https://github.com/bentley/rgbds/")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make -j1
}

package() {
  cd "$srcdir/$pkgname"
  # It has no DESTDIR option, just PREFIX
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man/man7"
  mkdir -p "$pkgdir/usr/share/man/man1"
  make PREFIX="$pkgdir/usr" MANPREFIX="$pkgdir/usr/share/man" install
  install -D LICENSE "$pkgdir/usr/share/licenses/rgbds-git/LICENSE"
}

# vim:set ts=2 sw=2 et:
