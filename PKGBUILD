# Maintainer: Galen Guyer <galen@galenguyer.com>

pkgname=saldl
pkgver=41
pkgrel=1
url="https://saldl.github.io"
pkgdesc="A CLI downloader optimized for speed and early preview, based on libcurl."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('AGPL')
depends=('curl' 'libevent')
makedepends=('unzip' 'python' 'git' 'asciidoc')
source=('https://github.com/saldl/saldl/archive/refs/tags/v41.zip')
md5sums=('e59e3822c165fdceb5398dbe42c4cc54')
sha256sums=('7c5df46863705503ee75559f6e499142cbed3ee05332983a55ee2ebb38fc78a2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./waf configure --prefix="/usr" --saldl-version="v$pkgver"
  ./waf build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  ./waf install --destdir="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
