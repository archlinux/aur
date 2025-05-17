# Maintainer: Galen Guyer <galen@galenguyer.com>

pkgname=saldl
pkgver=41
pkgrel=1
url="https://saldl.github.io"
pkgdesc="A CLI downloader optimized for speed and early preview, based on libcurl."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('AGPL-3.0-or-later')
depends=('curl' 'libevent')
makedepends=('unzip' 'python' 'git' 'asciidoc')
source=('https://github.com/saldl/saldl/archive/refs/tags/v41.zip'
        'https://waf.io/waf-2.1.5')
noextract=('waf-2.1.5')
md5sums=('e59e3822c165fdceb5398dbe42c4cc54'
         '2e7b2166c030dbac3e21891048df10aa')
sha256sums=('7c5df46863705503ee75559f6e499142cbed3ee05332983a55ee2ebb38fc78a2'
            '9d0b5d13e85f781b6976cfefb909b76cbc94a07419fa95d34216dca744257786')

prepare() {
  chmod +x "$srcdir/waf-2.1.5"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ../waf-2.1.5 configure --prefix="/usr" --saldl-version="v$pkgver"
  ../waf-2.1.5 build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  ../waf-2.1.5 install --destdir="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
