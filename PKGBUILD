# Maintainer: HurricanePooits <hurricanepootis@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgbase=libuev
pkgname=(libuev libuev-docs)
pkgver=2.4.1
pkgrel=2
pkgdesc='Lightweight event loop library'
arch=('x86_64')
url='https://github.com/troglobit/libuev'
license=('MIT')
depends=('glibc')
provides=('libuev.so=3-64')
conflicts=('libuev.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('aeeca1889a65ee1927845676da2c23f34e4c3ae770dedce8313dc6088bd92d52')

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package_libuev() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  rm -rf "$pkgdir/usr/share/doc"
}

package_libuev-docs() {
  arch=('any')
  depends=()
  provides=()
  cd "${pkgname::-5}-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  rm -rf "$pkgdir/usr/include" "$pkgdir/usr/lib"
}

# vim:set ts=2 sw=2 et:
