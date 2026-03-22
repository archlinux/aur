# Maintainer: Sergey A <murlakatamenka@disroot.org>

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164

pkgname=hdiff
pkgver=4.12.2
pkgrel=1
pkgdesc='C/C++ library and CLI tool for Diff & Patch between binary files or directories'
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url='https://github.com/sisong/HDiffPatch'
license=('MIT')
depends=('zlib' 'bzip2' 'zstd') #  zlib and bzip2 are in base
makedepends=('zlib' 'bzip2' 'zstd')
provides=('hdiffpatch')
conflicts=('hdiffpatch-bin')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('4002ba88006940f641b8df2e07444f4914579d906e1066a9b805559f0c5a4b2c')

prepare() {
  git clone --depth=1 https://github.com/sisong/libmd5.git ./libmd5
  git clone --depth=1 https://github.com/sisong/lzma.git ./lzma
}

build() {
  cd "HDiffPatch-$pkgver"

  make ZSTD=2 LDEF=0 ZLIB=2
}

package() {
  cd "HDiffPatch-$pkgver"

  install -Dm 755 ./hdiffz -t "$pkgdir/usr/bin"
  install -Dm 755 ./hpatchz -t "$pkgdir/usr/bin"

  install -Dm 644 ./LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
}
