# Maintainer: reazn reazn.dev@proton.me
pkgname=filesystem-full-text-search-indexer
pkgver=0.1.1
pkgrel=1
pkgdesc="Full-text search indexer for filesystem"
arch=('x86_64')
url="https://github.com/lhilfiker/filesystem-full-text-search-indexer"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'cmake' 'make')
source=("https://github.com/lhilfiker/filesystem-full-text-search-indexer/archive/refs/heads/main.tar.gz")
sha256sums=(35a3f2c9ac69406b10b434a641de90281537c9f88c931c4edc841788cc77a16f)

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
