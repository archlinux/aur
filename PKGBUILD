# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=jed
pkgver=0.99.19
_pkgver=0.99-19
pkgrel=7
pkgdesc="A freely available text editor"
arch=('i686' 'x86_64' 'armv7h')
_baseurl="https://www.jedsoft.org"
url="$_baseurl/jed"
license=('GPL-2.0-or-later')
depends=('glibc' 'slang' 'libx11')
makedepends=('libxt')
options=('!makeflags')
source=("$pkgname-$pkgver.tar.gz::$_baseurl/releases/$pkgname/$pkgname-$_pkgver.tar.gz")
md5sums=('fc35490b46303f9b88a4b1d4f3c1ba57')
install="$pkgname.install"


build() {
  cd "$pkgname-$_pkgver"

  ./configure --prefix=/usr JED_ROOT=/usr/share/jed

  sed \
    -e "s|\(^all.*\)|\1 xjed rgrep|" \
    -e "s|..DEST.*doc|$pkgdir/usr/share/doc/$pkgname|g" \
	-i src/Makefile

  make
}

package() {
  cd "$pkgname-$_pkgver"

  make DESTDIR="$pkgdir" install

  # Install rgrep
  install -Dm755 src/objs/rgrep "$pkgdir/usr/bin"
}
