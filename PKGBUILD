# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=mcp-kodi
pkgver=0.2.0
pkgrel=1
pkgdesc="MCP server that lets an AI assistant control Kodi over its JSON-RPC API"
arch=(x86_64)
url="https://github.com/laszlopere/mcp-kodi"
license=(GPL-3.0-only)
depends=(glib2 json-glib libsoup3)
makedepends=(git)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ab5e01b6397389f2ded075d373c3be5732904770df16d266cd2b694f48a3d5da')

prepare() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
