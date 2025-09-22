# Maintainer: reazn reazn.dev@proton.me
pkgname=filesystem-indexer
pkgver=0.1.1
pkgrel=1
pkgdesc="Full-text search indexer for filesystem"
arch=('x86_64')
url="https://github.com/lhilfiker/filesystem-full-text-search-indexer"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'cmake' 'make')
source=("https://github.com/lhilfiker/filesystem-full-text-search-indexer/archive/refs/heads/main.tar.gz")
sha256sums=(65ea9213c1cd995516beec7f1bca0870b5042973efca7206e79259d43e6515a7)

prepare() {
  cd "${srcdir}/filesystem-full-text-search-indexer-main"
  chmod +x build.sh
}

build() {
  cd "${srcdir}/filesystem-full-text-search-indexer-main"
  ./build.sh
}

package() {
  cd "${srcdir}/filesystem-full-text-search-indexer-main/build"

  install -Dm755 filesystem-indexer "${pkgdir}/usr/bin/filesystem-indexer"

  install -d "${pkgdir}/etc/filesystem-indexer"
  install -Dm644 ../config.txt.example "${pkgdir}/etc/filesystem-indexer/config.txt"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
